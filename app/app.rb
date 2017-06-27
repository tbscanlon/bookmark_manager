ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './app/init'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  get '/links/add' do
    erb :add
  end

  post '/links/add' do
    p params
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(tag: params[:tag])
    link.tags << tag
    link.save
    p LinkTag.get(link.id, tag.id)
    redirect '/links'
  end


  run! if app_file == $PROGRAM_NAME
end
