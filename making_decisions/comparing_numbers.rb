def max(array)
  max_num = array[0]

  array.each do |num|
    if num > max_num
      max_num = num
    end
  end
  max_num
end

def unique(array)
  array.uniq == array
end

def request_array(question)
  puts question
  gets.chomp.to_i
end

def create_array(first, second, third)
  new_array = []
  new_array << first << second << third
  new_array
end

def main_program
  first = request_array('Enter first number:')
  second = request_array('Enter second number:')
  third = request_array('Enter third: number')

  array = create_array(first, second, third)
  if unique(array)
    max_number = max(array)
    puts "The largest number is #{max_number}."
  else
    puts 'The numbers must be unique.'
  end
end

main_program
