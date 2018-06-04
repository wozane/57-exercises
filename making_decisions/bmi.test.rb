gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'bmi'

class BmiTest < Minitest::Test
  def test_bmi_calculation
    assert_equal 22.22, bmi_calculator_metric(50, 1.5)
  end
end
