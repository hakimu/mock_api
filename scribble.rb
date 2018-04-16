require_relative 'mock_client'
require_relative 'organization'
require 'json'

org_data = JSON.parse(MockClient.new("http://localhost:9292").org(26))
accounts = JSON.parse(MockClient.new("http://localhost:9292").accounts_by_org_id(26))
users = JSON.parse(MockClient.new("http://localhost:9292").users_by_org(26))
admin_users = JSON.parse(MockClient.new("http://localhost:9292").admin_users_by_org(26))
org = Organization.new(org_data["id"],org_data["name"],org_data["parent_id"],org_data["type"],accounts, users, admin_users)
puts org.inspect
puts org.flatten