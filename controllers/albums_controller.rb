require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/album.rb')

get '/albums' do
  @title = Album.all()
  erb( :index )
end
