require 'httparty'
require 'json'
require 'terminal-table'

# creates a connector to API
class SpaceConnector
  attr_reader :adapter

  def initialize(adapter = HTTParty)
    @adapter = adapter
  end

  def call
    adapter.get('http://api.open-notify.org/astros.json').to_s
  end
end

# parse API response
class SpaceParser
  def format_api(data)
    return '' if data.empty?

    response = JSON.parse(data)

    response
  end
end

# create report with people in space
class SpacePeopleReportGenerator
  attr_reader :space_connector, :space_praser

  def initialize
    @space_connector = SpaceConnector.new
    @space_praser = SpaceParser.new
  end

  def create_report
    space_praser.format_api(space_connector.call)
  end

  def print_people
    people_in_space = create_report['people']

    rows = []
    people_in_space.each do |post|
      rows << [post['name'], post['craft']]
    end
    rows
  end
end

# present generated report in table
class SpacePresenter
  attr_reader :people_report

  def initialize
    @people_report = SpacePeopleReportGenerator.new.print_people
  end

  def create_table
    table = Terminal::Table.new headings: %w[Name Craft], rows: people_report
    puts table
  end
end

SpacePresenter.new.create_table
