require 'minitest/autorun'
require 'minitest/pride'
require_relative 'word_frequency'

class WordFrequencyTest < MiniTest::Test
  def setup
    @csv = []
    file = File.join(File.expand_path(File.dirname(__FILE__)), 'word.txt')

    File.open(file, 'r') do |file|
      file.each_line do |line|
        arr = line.split(' ')
        arr.each do |word|
          @csv << word
        end
      end
    end
  end

  def test_sanity
    assert true, 'this should be true'
  end
end
