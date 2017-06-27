require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    p @links
    erb :links
  end

  run! if app_file == $PROGRAM_NAME
end
