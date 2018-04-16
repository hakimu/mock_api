require_relative 'mock_client'

class Account

  def initialize(id)
    @account = JSON.parse(MockClient.new("http://localhost:9292").account(id))
  end

  def revenue
    @account["revenue"]
  end

end

