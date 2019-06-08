require 'minitest/autorun'
require 'minitest/rg'
require_relative '../tag'

class TestTag < Minitest::Test

  def setup
    @tag1 = Tag.new({
      "tag_name" => "Food"
    })
  end

  def test_tag_name
    assert_equal("Food", @tag1.tag_name)
  end

end
