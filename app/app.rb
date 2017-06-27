require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    p params[:title]
    p params[:url]
    redirect '/links'
  end

  run! if app_file == $PROGRAM_NAME
end
