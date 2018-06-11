def request_answer(question)
  puts question
  gets.chomp
end

def give_answer(answer)
  puts answer
end

def engine_start_and_die?
  answer = request_answer('Does your car have fuel injection?')
  if answer == 'y'
    give_answer('Get it in for service.')
  else
    give_answer('Check to ensure the choke is opening and closing.')
  end
end

def making_clicking_noice?
  answer = request_answer('Does the car make a clicking noise?')
  if answer == 'y'
    give_answer('Replace the battery.')
  else
    fail_to_start?
  end
end

def fail_to_start?
  answer = request_answer('Does the car crank up but fail to start?')
  if answer == 'y'
    give_answer('Check spark plug connections')
  else
    engine_start_and_die?
  end
end

def car_silient?
  question = request_answer('Is the car silent when you turn the key?')

  if question == 'y'
    answer = request_answer('Are the battery terminals corroded?')
    if answer == 'y'
      give_answer('Clean terminals and try starting again.')
    else
      give_answer('Replace cables and try again.')
    end
  else
    making_clicking_noice?
  end
end

car_silient?
