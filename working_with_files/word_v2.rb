FILE = File.join(File.expand_path(File.dirname(__FILE__)), 'word.txt')
class FileReader
  def initialize(file = FILE)
    @file = file
  end

  def call
    File.open(file).each do |line|
      return line
    end
  end

  private

  attr_reader :file
end

# p FileReader.new.call

class ChangeStringToArray
  def change_to_array(string)
    text = []
    text << string
    text.to_a
    text
  end
end

# foo = FileReader.new.call
# bar = ElementExtraction.new.change_to_array(foo)

# puts bar.class # => array

class ExtractKeysAndValues
  
end

class Calculator
  def add(*arg)
    arg.reduce(:+)
  end
end

# cal = Calculator.new
# p cal.add(1,2)

