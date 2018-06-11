MONTHS = %w[none Jan Feb March April May June July August September October November December]
MONTHS.freeze

def info_request(question)
  puts question
  gets.chomp
end

def switch_number_to_month(number)
  MONTHS[number]
end

def main_program
  month = info_request('Please enter the number of month').to_i

  if month > 12
    puts 'That number is not valid'
  else
    month_name = switch_number_to_month(month)
    puts "The name of the month is #{month_name}."
  end
end

if __FILE__ == $0
  main_program
end
