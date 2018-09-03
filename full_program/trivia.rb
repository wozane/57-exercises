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

class TriviaCorrectAnswerParser
  def initialize(round_data)
    @round_data = round_data
  end

  def call
    round_data['correct_answer']
  end

  private
  attr_reader :round_data
end

class TriviaIncorrectAnswersParser
  def initialize(round_data)
    @round_data = round_data
  end

  def call
    round_data['incorrect_answers']
  end

  private
  attr_reader :round_data
end

class TriviaAnswersPresenter
  def initialize(correct_answer, incorrect_answers)
    @correct_answer = correct_answer
    @incorrect_answers = incorrect_answers
  end

  def call
    answers = []
    answers << correct_answer << incorrect_answers
    answers.flatten!.shuffle!
  end

  private
  attr_reader :correct_answer, :incorrect_answers
end

class UserInput
  def request_for_answer
    gets.chomp
  end
end

class TriviaGame
  def initialize(answers: TriviaAnswersPresenter,
                 connector: TrivaConnector,
                 correct_answer: TriviaCorrectAnswerParser,
                 incorrect_answers: TriviaIncorrectAnswersParser,
                 game_data_parser: TriviaParser,
                 round_data: TriviaRoundPresenter,
                 question: TriviaQuestion,
                 user_answer: UserInput)
    @answers = answers
    @connector = connector
    @correct_answer = correct_answer
    @incorrect_answers = incorrect_answers
    @game_data_parser = game_data_parser
    @round_data = round_data
    @question = question
    @user_answer = user_answer
  end

  def formated_steps
    welcome
    present_material(game_material)
  end

  def start_game
    formated_steps
  end

  private
  attr_reader :answers,
              :connector,
              :correct_answer,
              :incorrect_answers,
              :game_data_parser,
              :round_data,
              :question,
              :user_answer

  def welcome
    puts 'Welcome to *Trivia game*' + "\n"
  end

  def show_question(material)
    puts question.new(material).call
  end

  def format_answers(material)
    correct = correct_answer.new(material).call
    incorrect = incorrect_answers.new(material).call
    all = answers.new(correct, incorrect).call
    all.each_with_index do |element, index|
      p "#{index + 1} => #{element}"
    end
  end

  def present_material(material)
    show_question(material)
    answer_array = format_answers(material)
    correct = correct_answer.new(material).call
    index_of_correct_answer = answer_array.index(correct)
    count = 1
    loop do
      puts 'What is your answer?'
      answer_user_guess = request_user_answer.to_i
      guess = answer_user_guess - 1
      if answer_user_guess > 4
        puts 'Only numbers from 1 to 4'
        count += 1
      elsif guess != index_of_correct_answer
        count += 1
        puts 'Try again'
      else
        puts "Well done. It took you #{count} guesses"
        break
      end
    end
  end

  def game_material
    material = game_data_parser.new(connector.new.call).call
    parsed_material = round_data.new(material).call
    parsed_material
  end

  def request_user_answer
    user_answer.new.request_for_answer
  end
end

TriviaGame.new.start_game
