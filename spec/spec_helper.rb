require 'nokogiri'
require 'rack/test'
require 'rspec'

require_relative 'support/shared_examples/add_on'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def load_json_fixture(filename)
    fixture_path = File.join('../fixtures', filename)
    IO.read(File.expand_path(fixture_path, __FILE__), encoding: 'BOM|UTF-8')
  end
end

RSpec::Matchers.define :be_rejected do |_|
  match do |actual|
    document = Nokogiri::XML(actual)
    !document.at_xpath('/Response/Reject').nil?
  end
end

RSpec::Matchers.define :say do |content|
  match do |actual|
    document = Nokogiri::XML(actual)
    document.at_xpath('/Response/Say').content == content
  end
end

RSpec.configure { |c| c.include RSpecMixin }
