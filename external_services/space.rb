require 'httparty'
require 'json'
require 'terminal-table'

response = HTTParty.get('http://api.open-notify.org/astros.json').to_s
my_response = JSON.parse(response)
people_in_space = my_response['people']

rows = []
people_in_space.each do |post|
  rows << [post['name'], post['craft']]
end

table = Terminal::Table.new headings: %w[Name Craft], rows: rows

puts table
