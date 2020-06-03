require './fbi_app'
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
