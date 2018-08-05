require 'minitest/autorun'
require 'minitest/pride'
require_relative 'space_v2'

class SpaceParserTest < MiniTest::Test
  def test_format_method_returns_empty_string
    data = ''
    assert_empty format_api(data)
  end

  def test_JSON_format_is_returned
    cos = {"number"=>6}
    raw_data = "{\"number\": 6}"
    assert_equal cos, format_api(raw_data)
  end
end
