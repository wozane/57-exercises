require 'date'
def retirement_calculator
  puts 'What is your current age?'
  age = Integer(gets.chomp)
  puts 'At what age would you like to retire?'
  retire_age = Integer(gets.chomp)
  years_to_retire = retire_age - age

  if years_to_retire < 0
    puts 'You can already retire.'
  else
    puts "You have #{years_to_retire} years left until you can retire."
    year_today = Date.today.year
    retire_year = year_today + years_to_retire
    puts "It's #{year_today}, so you can retire in #{retire_year}."
  end
end

retirement_calculator
