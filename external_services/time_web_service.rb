require 'sinatra'
require 'json'

get '/time' do
  content_type :json
  { 'currentTime' => '2050-01-24 15:06:26' }.to_json
end
