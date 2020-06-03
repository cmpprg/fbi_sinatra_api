require 'sinatra'
require 'faraday'
require 'sinatra/json'
require './serializers/state_stats_serializer'
require './poros/state_stats'
require './services/fbi_service'

get '/' do
  'Hello world!'
end

get '/api/v1/crimes' do
  key = ENV["FBI_KEY"]
  state = params['state']

  crime_object = StateStats.new(state)
  json StateStatsSerializer.new(crime_object)
end
