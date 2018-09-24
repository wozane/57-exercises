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

class ExtractKeysAndValues
  def initialize(unsorted_array)
    @unsorted_array = unsorted_array
  end

  def call
    unsorted_array.split(' ').group_by(&:itself).transform_values(&:count)
  end

  private

  attr_reader :unsorted_array
end

class PrintData
  def initialize(sorted_array)
    @sorted_array = sorted_array
  end

  def call
    sorted_array.each do |key, value|
      puts "#{key}: #{'*' * value}"
    end
  end

  private

  attr_reader :sorted_array
end

class MainProgram
  def initialize(file = FileReader,
                 extractor = ExtractKeysAndValues,
                 presenter = PrintData)
    @file = file
    @extractor = extractor
    @presenter = presenter
  end

  def call
    raw_array = file.new.call
    extracted_array = extractor.new(raw_array).call
    ready_material = presenter.new(extracted_array).call
    ready_material
  end

  private

  attr_reader :file, :extractor, :presenter
end

if __FILE__ == $0
  MainProgram.new.call
end
