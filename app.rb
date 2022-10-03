require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do
    name = params[:name]

    return "Hello #{name}"
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you returned this message: #{message}"
  end
end