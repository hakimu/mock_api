require 'net/http'
require 'json'

class MockClient

  def initialize(base_uri)
    @key = ENV["API_KEY"]
    @base_uri = base_uri
  end

  def api_call(uri)
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri
      request.add_field("API_KEY","#{@key}")
      response = http.request request
      response.body
    end
  end

  def orgs(page=1)
    uri = URI("#{@base_uri}/orgs?page=#{page}")
    api_call(uri)
  end

  def org(id)
    uri = URI("#{@base_uri}/orgs/#{id}")
    api_call(uri)
  end

  def accounts(page=1)
    uri = URI("#{@base_uri}/accounts?page=#{page}")
    api_call(uri)
  end

  def account(id)
    uri = URI("#{@base_uri}/accounts/#{id}")
    api_call(uri)
  end

  def users(page=1)
    uri = URI("#{@base_uri}/users?page=#{page}")
    api_call(uri)
  end

  def user(id)
    uri = URI("#{@base_uri}/users/#{id}")
    api_call(uri)
  end

  def users_by_org(id)
    uri = URI("#{@base_uri}/users/org/#{id}")
    api_call(uri)
  end

  def admin_users_by_org(id)
    uri = URI("#{@base_uri}/users/org/#{id}/admin")
    api_call(uri)
  end

  def accounts_by_org_id(id)
    uri = URI("#{@base_uri}/accounts/org/#{id}")
    api_call(uri)
  end

end


