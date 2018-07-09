require 'minitest/autorun'
require 'minitest/pride'
require_relative 'word_frequency'

class WordFrequencyTest < MiniTest::Test
  def setup
    @csv = []
    file = File.join(File.expand_path(File.dirname(__FILE__)), 'word.txt')

    File.open(file, 'r') do |text|
      text.each_line do |line|
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

  def test_print_names_and_stars
    result = { 'badger' => 7, 'mushroom' => 2, 'snake' => 1 }

    assert_equal result, print_names_and_stars(@csv)
  end
end
