require "sinatra/base"
require "bundler/setup"
require "builder"
require "twilio_bot/version"
require "twilio_bot/dsl_accessor"
require "twilio_bot/twiml_builder"

class TwilioBot < Sinatra::Base
  extend DSLAccessor

  dsl_accessor :auth_token
  dsl_accessor :account_sid

  post "/:action" do
    content_type :xml
    xml = TwimlBuilder.new
    xml.instruct!
    @twilio = xml
    @twilio.Response { public_send(params[:action]) }
  end

  attr :twilio
end
