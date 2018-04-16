require_relative 'mock_client'

class AccountParser

  def initialize
    @accounts = []
  end

  def accounts
    @accounts_api = MockClient.new("http://localhost:9292").accounts
  end

end

# puts AccountParser.new.accounts