require 'minitest/autorun'
require 'minitest/rg'
require_relative '../tag'

class TestTag < Minitest::Test

  def setup
    @tag1 = Tag.new({
      "name" => "Food"
    })
  end

  def test_name
    assert_equal("Food", @tag1.name)
  end

end
