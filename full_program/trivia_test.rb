require 'minitest/autorun'
require 'minitest/pride'
require_relative 'trivia'

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
  def test_trivia_connector
    response = TriviaConnector.new(DummyRequest)
    assert_equal 'test', response.call
  end

  def test_trivia_parser
    parser = TriviaParser.new({ 'foo' => 'bar' }, DummyParser)
    assert_equal ({ 'foo' => 'bar' }), parser.call
  end

  def test_trivia_correct_answer_parser
    round = TriviaCorrectAnswerParser.new('correct_answer' => 'good_one')
    assert_equal 'good_one', round.call
  end

  def test_trivia_incorrect_answers_parser
    round = TriviaIncorrectAnswersParser.new('correct_answer' => 'good_one',
                                             'incorrect_answers' => 'bad_one')
    assert_equal 'bad_one', round.call
  end
end
