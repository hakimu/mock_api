require 'minitest/autorun'
require 'minitest/pride'

require_relative 'mock_client'

class MockClientTest < Minitest::Test

  def test_default_orgs
    skip
    expected = {"results":[26,3,8,28,35,6,10,25,23,19],"page":1,"pages":4}.to_json
    assert_equal expected, MockClient.new("http://localhost:9292").orgs
  end 

  def test_orgs_page_params
    expected_page_1_params = {"results":[26,3,8,28,35,6,10,25,23,19],"page":1,"pages":4}.to_json
    expected_page_2_params = {"results":[13,30,22,2,20,14,4,5,32,36],"page":2,"pages":4}.to_json
    assert_equal expected_page_1_params, MockClient.new("http://localhost:9292?page=1").orgs
    assert_equal expected_page_2_params, MockClient.new("http://localhost:9292?page=2").orgs(2)

  end
end