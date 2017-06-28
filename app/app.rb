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
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'

  end

  get '/links/add_tag' do
    erb :add_tag
  end

  post '/links/add_tag' do
    link = Link.first(title: params[:website])
    tag = Tag.first_or_create(name: params[:add_tag])
    link.tags << tag
    link.save
    p link.tags
    redirect '/links'
  end

  get '/tags/:search' do
    tag = Tag.first(name: params[:search])
    @links = tag.links
    erb :search
  end

  run! if app_file == $PROGRAM_NAME
end
