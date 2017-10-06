require 'sinatra'
require 'json'
require 'twilio-ruby'
require_relative 'lib/add_ons'

post '/' do
  content_type 'text/xml'

  if params.key?('AddOns')
    Twilio::TwiML::VoiceResponse.new do |r|
      add_ons = AddOns.new(JSON.parse(params['AddOns']))
      if add_ons.call_blocked?
        r.reject
      else
        r.say('Welcome to the jungle')
        r.hangup
      end
    end.to_s
  end
end
