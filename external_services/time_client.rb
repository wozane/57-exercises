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
    formated_data
  end

  private

  attr_reader :raw_time

  def split_value
    data_time = raw_time['currentTime']
    data_time.split(' ')
  end

  def formated_data
    present_month + ' ' + present_day + ' ' + present_year
  end

  def split_date
    Date.parse(split_value[0])
  end

  def present_month
    split_date.strftime('%B')
  end

  def present_year
    split_date.strftime('%Y')
  end

  def present_day
    split_date.strftime('%d')
  end
end

class TimeClient
  def initialize(connector = TimeConnector,
                 parser = TimeParser,
                 presenter = TimePresenter)
    @connector = connector
    @parser = parser
    @presenter = presenter
  end

  def call
    response = connector.new.call
    response_body = parser.new(response).call
    data_presenter = presenter.new(response_body).present
    "Today's date is: " + data_presenter
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
