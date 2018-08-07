def info_request(question)
  puts question
  Integer(gets.chomp)
end

def number_pick(input, rand_object=Kernel)
  if input == 1
    level = rand_object.rand(10)
  elsif input == 2
    level = rand_object.rand(100)
  elsif input == 3
    level = rand_object.rand(1000)
  end
  level
end

def main_program
  puts "Let's play Guess the Number."
  level = info_request('Pick a difficulty level (1, 2, or 3):')
  user_guess = info_request("I have my number. What's your guess?")
  guesses_count = 1
  computer_pick = number_pick(level)

  loop do
    if user_guess < computer_pick
      guesses_count += 1
      user_guess = info_request('Too low. Guess agian:')
    elsif user_guess > computer_pick
      guesses_count += 1
      user_guess = info_request('Too high. Guess agian:')
    elsif user_guess == computer_pick
      puts "Great, it took you #{guesses_count} guesses."
      break
    end
  end
end

if __FILE__ == $0
  main_program
end
