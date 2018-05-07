def compound_interest
  puts 'What is the principal amount?'
  principal = Integer(gets.chomp)
  puts 'What is the rate?'
  rate = Float(gets.chomp)
  puts 'What is the number of years?'
  years = Integer(gets.chomp)
  puts 'What is the number of times the interest is compounded per year?'
  compounded = Integer(gets.chomp)

  amount = principal * (1 + (rate / 100) / compounded)**(compounded * years)

  puts "$#{principal} invested at #{rate}% for #{years} years
  compounded #{compounded} times per year is $#{amount.round(2)}."
end

compound_interest
