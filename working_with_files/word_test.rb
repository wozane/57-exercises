require 'minitest/autorun'
require 'minitest/pride'
require_relative 'word'

DUMMY_ARRAY = 'snake badger badger badger'.freeze

class TestWord < MiniTest::Test
  def test_extract_keys_and_values
    test_array = ExtractKeysAndValues.new(DUMMY_ARRAY)
    result = { 'snake' => 1, 'badger' => 3 }
    assert_equal result, test_array.call
  end

  def test_print_data
    sorted_array = { 'snake' => 1, 'badger' => 3 }
    printing_array = PrintData.new(sorted_array)
    result = "snake: *\nbadger: ***"
    assert_equal result, printing_array.call
  end
end
