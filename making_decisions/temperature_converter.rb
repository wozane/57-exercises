def temperature_convertion_to_celsius(temp_in_fahrenheit)
  temp_in_fahrenheit.to_f
  celcius = (temp_in_fahrenheit - 32) * 5 / 9
  celcius
end

def temperature_convertion_to_fahrenheit(temp_in_celsius)
  temp_in_celsius.to_f
  fahrenheit = (temp_in_celsius * 9 / 5) + 32
  fahrenheit
end

def info_request(question)
  puts question
  gets.chomp
end

def welcome_statment
  puts "Press C to convert from Fahrenheit to Celsius.
Press F to convert from Celsius to Fahrenheit."
end

def main_program
  welcome_statment
  temp_unit = info_request('Your choice:').to_s.downcase

  if temp_unit == 'c'
    temp_in_c = info_request('Please enter the temperature in Celsius:').to_i
    temp_in_f = temperature_convertion_to_fahrenheit(temp_in_c)
    puts "The temperature in Fahrenheit: #{temp_in_f}"
  elsif temp_unit == 'f'
    temp_in_f = info_request('Please enter the temperature in Fahrenheit:').to_i
    temp_in_c = temperature_convertion_to_celsius(temp_in_f)
    puts "The temperature in Celsius is #{temp_in_c}"
  else
    puts 'Please type correct letter'
  end
end

main_program
