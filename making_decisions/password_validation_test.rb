gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/benchmark'
require_relative 'password_validation'

class TestPasswordValidation < MiniTest::Test
  def test_incorrect_password
    assert_equal false, check_password('abc')
  end

  def test_correct_password
    assert_equal true, check_password('abc$123')
  end

  def test_the_program_is_case_sensitive
    assert_equal false, check_password('ABC$123')
  end
end
