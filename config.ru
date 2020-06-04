require './fbi_app'
require 'rack/cors'

require ::File.expand_path('../../fbi_sinatra_api',  __FILE__)
run Sinatra::Application

use Rack::Cors do |config|
  config.allow do |allow|
    allow.origins '*'
    allow.resource '/file/list_all/', :headers => :any
    allow.resource '/file/at/*',
      :methods => [:get, :post, :put, :delete],
      :headers => :any,
      :max_age => 0
    allow.resource '/compound/*',
      :methods => [:get, :post],
      :headers => :any,
      :max_age => 0
  end
end
