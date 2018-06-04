gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'numbers_to_names'

class NumbersToNamesTest < Minitest::Test
  def test_switch
    assert_equal 'March', switch(3)
  end

  def test_november
    assert_equal 'November', switch(11)
  end
end
