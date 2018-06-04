def info_request(question)
  puts question
  gets.chomp
end

def switch(number)
  case number
  when 1
    'Jan'
  when 2
    'Feb'
  when 3
    'March'
  when 4
    'April'
  when 5
    'May'
  when 6
    'June'
  when 7
    'July'
  when 8
    'August'
  when 9
    'September'
  when 10
    'October'
  when 11
    'November'
  when 12
    'December'
  end
end

def main_program
  month = info_request('Please enter the number of month').to_i

  if month > 12
    puts 'That number is not valid'
  else
    month_name = switch(month)
    puts "The name of the month is #{month_name}."
  end
end

main_program
