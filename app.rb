require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Google"
  end

  run! if app_file == $PROGRAM_NAME
end
