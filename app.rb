require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do

    return erb(:index)
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you returned this message: #{message}"
  end

  get '/names' do
    names = params[:names]

    return names
  end

  post '/sort_names' do
    names = params[:names]

    sorted_names = names.split(',').sort.join(',')
    return sorted_names
  end
end