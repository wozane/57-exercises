require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/benchmark'
require_relative 'validating_inputs'

class TestValidatingInputs < MiniTest::Test
  def test_given_name_with_one_character
    assert_equal false, given_name('J')
  end

  def test_given_name_with_two_characters
    assert_equal true, given_name('Jo')
  end

  def test_employee_id_with_correct_format
    assert_equal true, employee_id('AA-1234')
  end

  def test_employee_id_with_incorrect_format_one_letter
    assert_equal false, employee_id('A-1234')
  end

  def test_employee_id_with_incorrect_format_with_3_numbers
    assert_equal false, employee_id('AA-123')
  end

  def test_zip_code_has_incorrect_format
    assert_equal false, zip_code('S1234')
  end

  def test_zip_code_has_numbers
    assert_equal true, zip_code('1234')
  end
end
