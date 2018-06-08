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
