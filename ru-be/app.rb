require 'sinatra'
require 'sinatra/json'

class App < Sinatra::Base
  configure do
    set :protection, :except => [:json_csrf]
    set :base_url, ENV['BASE_URL'] || 'http://localhost:4567'
    set :public_folder, File.dirname(__FILE__) + '/public'
  end

  before do
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  get '/api/avatar' do
    content_type 'image/jpeg'
    cache_control :public, :max_age => 36000 
    send_file File.join(settings.public_folder, 'a0.jpg'), :disposition => 'inline'
  end

  get '/' do
    { message: "Welcome!" }.to_json
  end
end