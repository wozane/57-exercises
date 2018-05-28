gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'tax_calculator'

class TaxCalculatorTest < Minitest::Test
  Tax = 0.55

  def test_check_state_when_true
    assert_equal true, check_state('wi')
  end

  def test_check_state_returns_false
    assert_equal false, check_state('2e')
  end

  def test_calculating_tax_amount
    assert_equal 10.55, calc_taxed_amount(10)
  end

  def test_calculated_taxed_amount_is_rounded
    assert_equal 1.78, calc_taxed_amount(1.234)
  end

  def test_display_tax
    assert_equal "The tax is $#{Tax}", display_tax
  end

  def test_display_subtotal
    assert_equal 'The subtotal is $22.', display_subtotal(22)
  end

  def test_display_total
    assert_equal 'The total is $aaa.', display_total('aaa')
  end
end
