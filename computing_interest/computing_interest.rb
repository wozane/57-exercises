def computing_interest
  puts 'Enter the principal:'
  principal = Integer(gets.chomp)
  puts 'Enter the rate of interest:'
  interest_rate = Float(gets.chomp) / 100
  puts 'Enter the number of years:'
  years = Integer(gets.chomp)

  interest_formula = (principal * (1 + (interest_rate * years))).to_i

  puts "After #{years} years at #{interest_rate}%,the investment will be worth $#{interest_formula}."
end

computing_interest
