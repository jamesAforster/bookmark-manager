require 'sinatra/base'
require './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    'my bookmark'
    bookmarks = Bookmark.all
    @bookmarks = bookmarks
    erb :bookmarks
  end

  post '/add_bookmark' do
    Bookmark.create_bookmark(bookmark: params[:new_bookmark_url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
