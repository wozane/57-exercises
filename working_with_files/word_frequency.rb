text = []

File.open('word.txt', 'r') do |file|
  file.each_line do |line|
    arr = line.split(' ')
    arr.each do |word|
      text << word
    end
  end
end

def print_star(number)
  times = count_words(number)
  print '*' * times
end

def print_names_and_stars(text)
  arr = text.to_a
  sorted = arr.group_by(&:itself).transform_values(&:count)
  sorted.each do |key, value|
    # star = print_star(value)
    puts "#{key}: #{'*' * value}"
  end
end

print_names_and_stars(text)
