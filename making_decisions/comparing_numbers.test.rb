gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'comparing_numbers'

class ComparingNumbersTest < MiniTest::Test
  def test_finding_max_number
    assert_equal 120, max([1, 2, 3, 4, 5, 120, 6, 7, 8, 9])
  end

  def test_that_the_numbers_are_unique
    assert_equal true, unique([1, 2, 3])
  end

  def test_that_array_has_duplicate_numbers
    assert_equal false, unique([1, 1, 2, 3])
  end

  def test_creating_array_with_entered_numbers
    assert_equal [1, 2, 3], create_array(1,2,3)
  end
end
