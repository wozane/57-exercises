require 'csv'
file = File.join(File.expand_path(File.dirname(__FILE__)), 'data.csv')

def info_request(question)
  puts question
  gets.chomp
end

CSV.open(file, headers: true) do |employee|
  search_string = info_request('Enter a search string:')
  employees = employee.each
  employees.select do |row|
    if row['First Name'].include?(search_string) || row['Last Name'].include?(search_string)
      puts row['First Name']
    else
      puts 'not found'
    end
  end
end
