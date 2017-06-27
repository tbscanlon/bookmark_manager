ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './app/init'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/add' do
    erb :add
  end

  post '/links/add' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.create(tag: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end


  run! if app_file == $PROGRAM_NAME
end
