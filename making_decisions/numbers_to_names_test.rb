require 'minitest/autorun'
require 'minitest/pride'
require_relative 'numbers_to_names'

class NumbersToNamesTest < Minitest::Test
  def test_switch
    assert_equal 'March', switch_number_to_month(3)
  end

  def test_november
    assert_equal 'November', switch_number_to_month(11)
  end
end
