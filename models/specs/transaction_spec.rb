require 'minitest/autorun'
require 'minitest/rg'
require_relative '../transaction'
require_relative '../merchant'
require_relative '../tag'

class TestTransaction < Minitest::Test

  def setup
    @merchant1 = Merchant.new({
      "name" => "Tommy's TakeAway"
    })
    @merchant1.save()

    @tag1 = Tag.new({
      "name" => "Food"
    })
    @tag1.save()

    @transaction1 = Transaction.new({
      "amount" => 1230,
      "notes" => "Test note"
      "merchant_id" => @merchant1.id,
      "tag_id" => @tag1.id
    })
  end

  def test_transaction_amount
    assert_equal(12.30, (@transaction1.amount/100.to_f).round(2))
  end

  def test_transaction_merchant_id
    assert_equal(@merchant1.id, @transaction1.merchant_id)
  end

  def test_transaction_tag_id
    assert_equal(@tag1.id, @transaction1.tag_id)
  end

end
