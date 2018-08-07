require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/benchmark'
require 'ostruct'
require_relative 'game'

class TestGame < MiniTest::Test
  def test_number_pick_is_larger_than_3
    random_number = OpenStruct.new
    assert_equal rand(10), number_pick(1, random_number.rand(10))
  end
end
