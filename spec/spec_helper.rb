$:.unshift File.expand_path('../../lib', __FILE__)
require 'twilio_bot'
require 'rack/test'
require 'sinatra'

require_relative 'support/sinatra'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include SinatraSupport
end
