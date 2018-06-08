require_relative 'tax_calculator'

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