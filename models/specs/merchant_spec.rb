require 'minitest/autorun'
require 'minitest/rg'
require_relative '../merchant'

class TestMerchant < Minitest::Test

  def setup
    @merchant1 = Merchant.new({
      "merchant_name" => "Tommy's TakeAway"
    })
  end

  def test_merchant_name
    assert_equal("Tommy\'s TakeAway", @merchant1.merchant_name)
  end

end
