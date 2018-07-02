require 'minitest/autorun'
require 'minitest/pride'
require_relative 'temperature_converter'

class TemperatureConverterTest < Minitest::Test
  def test_temperature_convertion_to_celcius
    assert_equal 0, temperature_convertion_to_celsius(32)
  end

  def test_temperature_convertion_to_celcius_minus_figures
    assert_equal (-40), temperature_convertion_to_celsius(-40)
  end

  def test_temperature_convertion_to_celcius_2
    assert_equal -10, temperature_convertion_to_celsius(14)
  end

  def test_temp_convertion_to_Fahrenheit
    assert_equal 32, temperature_convertion_to_fahrenheit(0)
  end

  def test_temp_convertion_to_Fahrenheit_2
    assert_equal 104, temperature_convertion_to_fahrenheit(40)
  end

  def test_temp_convertion_to_Fahrenheit_3
    assert_equal -130, temperature_convertion_to_fahrenheit(-90)
  end
end
