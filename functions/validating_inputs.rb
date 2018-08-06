def info_request(question)
  puts question
  gets.chomp
end

def given_name(input)
  input.size >= 2
end

def employee_id(input)
  regexp = /^[a-zA-z]{2}-\d{4}$/
  input.match?(regexp)
end

def zip_code(input)
  input.match?(/\A-?\d+\Z/)
end

def main_program
  first_name = info_request('Enter the first name:')
  last_name = info_request('Enter the last name:')
  zip = info_request('Enter the ZIP code:')
  id = info_request('Enter an employee ID:')

  puts 'The first name must be filled in.' if given_name(first_name) != true
  puts 'The last name must be filled in.' if given_name(last_name) != true
  puts 'The ZIP code must be numeric.' if zip_code(zip) != true
  puts "#{id} is not a valid ID." if employee_id(id) != true
  puts 'There were no errors found.' if given_name(first_name) &&
                                        given_name(last_name) &&
                                        zip_code(zip) &&
                                        employee_id(id)
end

main_program
