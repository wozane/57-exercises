gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'temperature_converter'

class TemperatureConverterTest < Minitest::Test
  def test_temperature_convertion_to_celcius
    assert_equal 0, temperature_convertion_to_celsius(32)
  end

  def test_temp_convertion_to_F
    assert_equal 32, temperature_convertion_to_fahrenheit(0)
  end
end
