Tax = 0.55

def info_request(question)
  puts question
  gets.chomp
end

def check_state(state)
  state == 'wi'
end

def calc_taxed_amount(amount)
  (amount + Tax).round(2)
end

def display_tax
  puts "The tax is $#{Tax}"
end

def display_subtotal(amount)
  puts "The subtotal is $#{amount}."
end

def display_total(taxed_amount)
  puts "The total is $#{taxed_amount}."
end

def main_program
  amount = info_request('What is the order amount?').to_f.round(2)
  state = info_request('What is the state?').to_s.downcase

  if check_state(state)
    display_tax(Tax)
    display_subtotal(amount)
    total = calc_taxed_amount(amount)
    display_total(total)
  else
    display_total(amount)
  end
end

main_program
