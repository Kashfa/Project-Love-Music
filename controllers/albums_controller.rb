
require_relative('../models/album.rb')

get '/albums' do
  @albums = Album.all()
  erb( :index )
end

post '/albums' do
  @album = Album.new(params)
  @album.save()
  erb( :create )
end

get '/albums/new' do
  @artists = Artist.all()
  erb( :new )
end

get'/albums/:id' do
  @album = Album.find( params[:id].to_i )
  erb( :show )
end

get '/albums/:id/edit' do
  @album = Album.find( params[:id].to_i)
  @artists = Artist.all()
  erb( :edit )
end

post '/albums/:id' do
  stock  = Album.new( params )
  stock.update()
  redirect to '/albums'
end

post '/albums/:id/delete' do
  stock = Album.find(params[:id].to_i)
  stock.delete()
  redirect to '/albums'
end
