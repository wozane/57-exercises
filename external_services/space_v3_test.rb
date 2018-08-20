require 'minitest/autorun'
require_relative 'space_v3'
require 'ostruct'

class DummyRequest
  def self.get(_)
    OpenStruct.new(body: 'test')
  end
end

class DummyParser
  def self.parse(data)
    data
  end
end

class DummyConnector
  def call
    'test'
  end
end

class DummySpaceParser
  def initialize(data)
    @data = data
  end

  def call
    @data
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

class TestSpace < Minitest::Test
  HEADER = 'Name                          | Craft\n' +
           '-------------------------------------\n'

  def test_space_connector
    connector = SpaceConnector.new(DummyRequest)
    assert_equal 'test', connector.call
  end

  def test_space_parser
    parser = SpaceParser.new({ 'people' => 'test' }, DummyParser)
    assert_equal 'test', parser.call
  end

  def test_presenter_1
    presenter = SpacePresenter.new([])
    assert_equal HEADER, presenter.present
  end

  def test_presenter_2
    presenter = SpacePresenter.new([{ 'name' => 'test', 'craft' => 'space' }])
    expected = HEADER + 'test' + ' ' * 26 + '| space\n'
    assert_equal expected, presenter.present
  end

  def test_space
    space = Space.new(DummyConnector, DummySpaceParser, DummyPresenter)
    assert_equal 'test', space.call
  end
end
