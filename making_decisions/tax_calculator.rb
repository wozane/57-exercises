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
  "The tax is $#{Tax}"
end

def display_subtotal(amount)
  "The subtotal is $#{amount}."
end

def display_total(taxed_amount)
  "The total is $#{taxed_amount}."
end

def main_program
  amount = info_request('What is the order amount?').to_f.round(2)
  state = info_request('What is the state?').to_s.downcase

  if check_state(state)
    puts display_tax
    puts display_subtotal(amount)
    total = calc_taxed_amount(amount)
    puts display_total(total)
  else
    puts display_total(amount)
  end
end

main_program
