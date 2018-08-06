# documentation
class Validator
  def initialize
    puts 'Enter the first name:'
    @first_name = gets.chomp
    puts 'Enter the last name:'
    @last_name = gets.chomp
    puts 'Enter the ZIP code:'
    @zip = gets.chomp
    puts 'Enter an employee ID:'
    @id = gets.chomp
  end

  def valid?
    first_name_valid? &&
      last_name_valid? &&
      id_valid? &&
      zip_valid?
  end

  def errors
    return 'There were no errors found.' if valid?
    errors = []
    errors << 'The first name must be filled in.' unless first_name_valid?
    errors << 'The last name must be filled in.' unless last_name_valid?
    errors << 'The ZIP code must be numeric.' unless zip_valid?
    errors << "#{id} is not a valid ID." unless id_valid?
    puts errors
  end

  private

  attr_reader :first_name, :last_name, :zip, :id

  def first_name_valid?
    first_name.length >= 2
  end

  def last_name_valid?
    last_name.length >= 2
  end

  def id_valid?
    regexp = /^[a-zA-z]{2}-\d{4}$/
    id.match?(regexp)
  end

  def zip_valid?
    zip.match?(/\A-?\d+\Z/)
  end
end

edi = Validator.new
edi.errors
