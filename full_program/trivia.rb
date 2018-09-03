class TriviaQuestion
  def initialize(question)
    @question = question
  end

  def call
    question.random
  end

  private
  attr_reader :question
end

class TriviaAnswers
  def initialize(answer)
    @answer = answer
  end

  def call
    answer
  end

  private
  attr_reader :answer
end
