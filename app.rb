require 'sinatra'
require 'json'
require 'twilio-ruby'
require_relative 'lib/add_ons'

post '/' do
  if params.key?('AddOns')
    response = Twilio::TwiML::VoiceResponse.new do |r|
      add_ons = AddOns.new(JSON.parse(params['AddOns']))
      if add_ons.call_blocked?
        r.reject
      else
        r.say(message: 'Welcome to the jungle')
        r.hangup
      end
    end
    content_type 'text/xml'
    return response.to_s
  end
end
