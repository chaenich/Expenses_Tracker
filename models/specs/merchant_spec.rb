require 'minitest/autorun'
require 'minitest/rg'
require_relative '../merchant'

class TestMerchant < Minitest::Test

  def setup
    @merchant1 = Merchant.new({
      "name" => "Tommy's TakeAway"
    })
  end

  def test_name
    assert_equal("Tommy\'s TakeAway", @merchant1.name)
  end

end
