require 'httparty'
require 'json'

class SpaceConnector
  def initialize(adapter = HTTParty)
    @adapter = adapter
  end

  def call
    adapter.get('http://api.open-notify.org/astros.json').body
  end

  private

  attr_reader :adapter
end

class SpaceParser
  def initialize(data_string, parser = JSON)
    @data_string = data_string
    @parser = parser
  end

  def call
    parser.parse(data_string)['people']
  end

  private

  attr_reader :data_string, :parser
end

class SpacePresenter
  def initialize(data)
    @data = data
  end

  def to_s
    header + rows
  end

  def present
    to_s
  end

  private

  attr_reader :data

  def header
    string = "#{'Name'.ljust(30, ' ')}| Craft"
    string += '\n'
    string += '-' * 37
    string += '\n'
    string
  end

  def rows
    data.map { |person| row(person) }.join('\n')
  end

  def row(person)
    string = person['name'].ljust(30, ' ')
    string += '| '
    string += person['craft']
    string += '\n'
    string
  end
end

class Space
  def initialize(connector=SpaceConnector, parser=SpaceParser, presenter=SpacePresenter)
    @connector = connector
    @parser = parser
    @presenter = presenter
  end

  def call
    response = connector.new.call
    parsed_response = parser.new(response).call
    presenter.new(parsed_response).present
  end

  private
  attr_reader :connector, :presenter, :parser
end
