require_relative 'mock_client'
require_relative 'account'
require_relative 'organization'
require 'json'

class InputOrg

  def initialize(org_id, *children)
    @org = org_id.to_i
    @children = children
  end

  def create(id)
    retries ||= 0
    org_data = JSON.parse(MockClient.new("http://localhost:9292").org(id))
    accounts = JSON.parse(MockClient.new("http://localhost:9292").accounts_by_org_id(id))
    users = JSON.parse(MockClient.new("http://localhost:9292").users_by_org(id))
    # admin_users = JSON.parse(MockClient.new("http://localhost:9292").admin_users_by_org(id))
    Organization.new(org_data["id"],org_data["name"],org_data["parent_id"],org_data["type"], accounts, users)
    # retry in the event of a parsing problem due to a random 'service unavailable'
    rescue JSON::ParserError
      retry if (retries += 1) <= 5
  end

  def create_org
    create(@org)
  end

  def create_children
    @children.map do |child|
      create(child)
    end
  end

  def flatten
  end

end

io = InputOrg.new(4,22,26,39)
organization = io.create_org
puts organization.calculate_support_score
puts organization.subsidiary?
# puts io.create_children.inspect
# puts org = InputOrg.new(4,[22,26]).create_org(@org).inspect
# puts io.create_children.inspect