require 'date'
require 'httparty'
require 'json'

class TimeConnector
  def initialize(connector = HTTParty)
    @connector = connector
  end

  def call
    connector.get('http://localhost:4567/time').body
  end

  private

  attr_reader :connector
end

class TimeParser
  def initialize(data_to_parse, parser = JSON)
    @data_to_parse = data_to_parse
    @parser = parser
  end

  def call
    parser.parse(data_to_parse)
  end

  private

  attr_reader :data_to_parse, :parser
end

class TimePresenter
  def initialize(raw_time)
    @raw_time = raw_time
  end

  def present
    "Today's date is: " + formated_data
  end

  private

  attr_reader :raw_time

  def split_value
    data_time = raw_time['currentTime']
    split_string = data_time.split(' ')
    split_string
  end

  def formated_data
    present_month + present_day + present_year
  end

  def present_month
    month = Date.parse(split_value[0]).strftime('%B')
    month += ' '
    month
  end

  def present_year
    year = Date.parse(split_value[0]).strftime('%Y')
    year
  end

  def present_day
    day = Date.parse(split_value[0]).strftime('%d')
    day += ' '
    day
  end
end

class TimeClient
  def initialize(connector = TimeConnector, parser = TimeParser, presenter = TimePresenter)
    @connector = connector
    @parser = parser
    @presenter = presenter
  end

  def call
    response = connector.new.call
    response_body = parser.new(response).call
    presenter.new(response_body).present
  end

  private

  attr_reader :connector, :parser, :presenter
end
# response = TimeConnector.new.call
# foo = TimeParser.new(response).call

# p TimePresenter.new(foo).present
if __FILE__ == $0
  puts TimeClient.new.call
end
