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

class ChangeStringToArray
  def initialize(string)
    @string = string
  end

  def call
    text = []
    text << string
    text.to_a
    text
  end

  private

  attr_reader :string
end

class ExtractKeysAndValues
  def initialize(unsorted_array)
    @unsorted_array = unsorted_array
  end

  def call
    sorted_array = unsorted_array.group_by(&:itself).transform_values(&:count)
    sorted_array
  end

  private

  attr_reader :unsorted_array
end

class PrintData < ExtractKeysAndValues
  def initialize(sorted_array = ExtractKeysAndValues)
    @sorted_array = sorted_array
  end

  def call
    sorted_array.each do |key, value|
      "#{key}: #{'*' * value}"
    end
  end

  private

  attr_reader :sorted_array
end

class MainProgram
  def initialize(file = FileReader,
                 changer = ChangeStringToArray,
                 extractor = ExtractKeysAndValues,
                 presenter = PrintData)
    @file = file
    @changer = changer
    @extractor = extractor
    @presenter = presenter
  end

  def call
    raw_array = file.new.call
    changed_array = changer.new(raw_array).call
    extracted_array = extractor.new(changed_array).call
    prepared_array = presenter.new(extracted_array).call
    prepared_array
  end

  private

  attr_reader :file, :changer, :extractor, :presenter
end

if __FILE__ == $0
  puts MainProgram.new.call
end
