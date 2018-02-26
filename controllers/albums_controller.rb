
require_relative('../models/album.rb')

get '/albums' do
  @albums = Album.all()
  erb( :index )
end

post '/albums' do
  @albums = Album.new()
  erb( :create )
end
