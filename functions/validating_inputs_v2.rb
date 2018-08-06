# documentation
class Validator
  attr_reader :first_name, :last_name, :zip, :id

  def initialize(first_name:, last_name:, zip:, id:)
    @first_name = first_name
    @last_name =  last_name
    @zip = zip
    @id = id
  end

  def valid?
    first_name_valid? &&
      last_name_valid? &&
      id_valid? &&
      zip_valid?
  end

  def errors
    return unless valid?
    errors = []
    errors << 'The first name must be filled in.' unless first_name_valid?
    errors << 'The last name must be filled in.' unless last_name_valid?
    errors << 'The ZIP code must be numeric.' unless zip_valid?
    errors << "#{id} is not a valid ID." unless id_valid?

    errors
  end

  private

  def first_name_valid?
    first_name.size >= 2
  end

  def last_name_valid?
    last_name >= 2
  end

  def id_valid?
    regexp = /^[a-zA-z]{2}-\d{4}$/
    id.match?(regexp)
  end

  def zip_valid?
    zip.match?(/\A-?\d+\Z/)
  end
end
