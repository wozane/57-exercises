require 'minitest/autorun'
require 'minitest/pride'
require_relatice 'trivia'

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

class TestTrivia < Minitest::Test
  
end
