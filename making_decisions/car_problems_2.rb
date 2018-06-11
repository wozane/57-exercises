is_car_silent = 'Is the car silent when you turn the key?'
is_battery_corroded = 'Are the battery terminals corroded?' 
battery_corroded = 'Clean terminals and try starting again.'
battery_not_corroded = 'Replace cables and try again.'
is_making_clicking_noice = 'Does the car make a clicking noise?'
making_clicking_noice = 'Replace the battery.'
does_fail_to_start = 'Does the car crank up but fail to start?'
fail_to_start = 'Check spark plug connections'
does_engine_start_and_die = 'Does the engine start and then die?'
is_fuel_injection = 'Does your car have fuel injection?'
fuel_injection = 'Get it in for service.'
no_fuel_injection = 'Check to ensure the choke is opening and closing.'


Question = %W[
  #{is_car_silent}
  #{is_battery_corroded}
  #{battery_corroded}
  #{battery_not_corroded}
  #{is_making_clicking_noice}
  #{making_clicking_noice}
  #{does_fail_to_start}
  #{fail_to_start}
  #{does_engine_start_and_die}
  #{is_fuel_injection}
  #{fuel_injection}
  #{no_fuel_injection}
]

def asking_question(number)
  puts Question[number]
  gets.chomp
end

def give_answer(number)
  puts Question[number]
end

def yes_answer(answer)
  answer == 'y'
end

def main_program
  if_silent_question = asking_question(0)
  if yes_answer(if_silent_question)
    battery_question = asking_question(1)
    if yes_answer(battery_question)
      give_answer(2)
    else
      give_answer(3)
    end
  else
    noice_question = asking_question(4)
    if yes_answer(noice_question)
      give_answer(5)
    else
      fail_question = asking_question(6)
      if yes_answer(fail_question)
        give_answer(7)
      else
        start_question = asking_question(8)
        if yes_answer(start_question)
          fuel_question = asking_question(9)
          if yes_answer(fuel_question)
            give_answer(10)
          else
            give_answer(11)
          end
        else
          give_answer(10)
        end
      end
    end
  end
end

main_program
