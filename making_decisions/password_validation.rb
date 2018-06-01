require 'io/console'

PASSWORD = 'abc$123'.freeze

def request_password(request)
  puts request
  STDIN.noecho(&:gets).chomp
end

def check_password(inserted_password)
  inserted_password == PASSWORD
end

def main_program
  input = request_password('What is the password?')

  if check_password(input)
    puts 'Welcome!'
  else
    puts "I don't know you."
  end
end

main_program
