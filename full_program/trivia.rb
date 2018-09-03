require 'HTTParty'
require 'json'

class TrivaConnector
  def initialize(connector = HTTParty)
    @connector = connector
  end

  def call
    connector.get('https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple').body
  end

  private
  attr_reader :connector
end

class TriviaParser
  def initialize(data_to_parse, parser = JSON)
    @data_to_parse = data_to_parse
    @parser = parser
  end

  def call
    parser.parse(data_to_parse)
  end

  private
  attr_reader :data_to_parse, :parser
end

class TriviaRoundPresenter
  def initialize(data)
    @data = data
  end

  def call
    data['results'].sample
  end

  private
  attr_reader :data
end

class TriviaQuestion
  def initialize(round_data)
    @round_data = round_data
  end

  def call
    round_data['question']
  end

  private
  attr_reader :round_data
end

class TriviaAnswers
  def initialize(round_data)
    @round_data = round_data
  end

  def call
    correct_answer + incorrect_answers
  end

  private
  attr_reader :round_data

  def correct_answer
    round_data['correct_answer'] + ', '
  end

  def incorrect_answers
    round_data['incorrect_answers'].join(', ')
  end
end

all = TriviaParser.new(TrivaConnector.new.call).call
round = TriviaRoundPresenter.new(all).call

question = TriviaQuestion.new(round).call
answers = TriviaAnswers.new(round).call
puts question
puts answers
