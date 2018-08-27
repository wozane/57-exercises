require 'minitest/autorun'
require 'minitest/pride'
require_relative 'time_client'
require 'ostruct'

class DummyRequest
  def self.get(_)
    OpenStruct.new(body: 'test')
  end
end

class DummyParser
  def self.parse(foobar)
    @foobar = foobar
  end

  def call
    @foobar
  end
end

class DummyPresenter
  def initialize(data)
    @data = data
  end

  def present
    @data
  end
end

class TestTimeClient < Minitest::Test
  def test_time_connector
    response = TimeConnector.new(DummyRequest)
    assert_equal 'test', response.call
  end

  def test_time_parser
    parser = TimeParser.new({ 'time' => 'test' }, DummyParser)
    assert_equal ({ 'time' => 'test' }), parser.call
  end

  def test_time_presenter
    presenter = TimePresenter.new('currentTime' => '2018-04-24')
    assert_equal 'April 24 2018', presenter.present
  end
end
