require 'sinatra'
require 'sinatra/json'

class App < Sinatra::Base
  get '/' do
    json message: "Welcome!"
  end
end