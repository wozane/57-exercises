def main_program
  puts 'What is the order amount?'
  amount = Integer(gets.chomp)
  puts 'What is the state?'
  state = gets.chomp.to_s.downcase
  tax = 0.55

  if state == 'wi'
    taxed_amount = amount + tax
    puts "The subtotal is $#{amount.round(2)}.
    The tax is $#{tax}.
    The total is $#{taxed_amount}."
  else
    puts "The total is $#{amount.round(2)}."
  end
end

main_program
