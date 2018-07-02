text = []

file = File.join(File.expand_path(File.dirname(__FILE__)), 'word.txt')

File.open(file, 'r') do |file|
  file.each_line do |line|
    arr = line.split(' ')
    arr.each do |word|
      text << word
    end
  end
end

def print_names_and_stars(text)
  arr = text.to_a
  sorted = arr.group_by(&:itself).transform_values(&:count)
  sorted.each do |key, value|
    puts "#{key}: #{'*' * value}"
  end
end

print_names_and_stars(text)
