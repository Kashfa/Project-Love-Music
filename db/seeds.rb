require_relative('../models/artist')
require_relative('../models/album')
require_relative('../models/stock')


Stock.delete_all
Album.delete_all
Artist.delete_all

artist1 = Artist.new({"name" => "Oasis"})

artist2 = Artist.new({"name" => "Blur"})

artist3 = Artist.new({"name" => "Nirvanna"})

artist4 = Artist.new({"name" => "Jamiroquai"})

artist5 = Artist.new({"name" => "Aretha Franklin"})

artist6 = Artist.new({"name" => "Spice Girls"})

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save
artist6.save

album1 = Album.new({
  'title' => 'Definitely Maybe',
  'genre' => 'Britpop',
  'quantity' => 20,
  'buy_price' => 4,
  'sell_price' => 10,
  'artist_id' => artist1.id })

album2 = Album.new({
  'title' => 'Parklife',
  'genre' => 'Britpop',
  'quantity' => 45,
  'buy_price' => 3,
  'sell_price' => 7,
  'artist_id' => artist2.id })

album3 = Album.new({
 'title' => 'Nevermind',
  'genre' => 'Grunge',
  'quantity' => 50,
  'buy_price' => 5,
  'sell_price' => 10,
  'artist_id' => artist3.id })

album4 = Album.new({
 'title' => 'Emergency on Planet Earth',
  'genre' => 'Dance-Pop',
  'quantity' => 35,
  'buy_price' => 5,
  'sell_price' => 8,
  'artist_id' => artist4.id })

album5 = Album.new({
 'title' => 'Once in a Lifetime',
  'genre' => 'Soul',
  'quantity' => 60,
  'buy_price' => 4,
  'sell_price' => 10,
  'artist_id' => artist5.id })

album6 = Album.new({
 'title' => 'Spiceworld',
  'genre' => 'pop',
  'quantity' => 54,
  'buy_price' => 2,
  'sell_price' => 6,
  'artist_id' => artist6.id })


album1.save
album2.save
album3.save
album4.save
album5.save
album6.save


stock1 = Stock.new({
 'album_id' => album1.id,
 'stock_level' => 20})

stock2 = Stock.new({
 'album_id' => album2.id,
 'stock_level' => 45})

stock3 = Stock.new({
 'album_id' => album3.id,
 'stock_level' => 50})

stock4 = Stock.new({
 'album_id' => album4.id,
 'stock_level' => 35})

stock5 = Stock.new({
 'album_id' => album5.id,
 'stock_level' => 60})

stock6 = Stock.new({
 'album_id' => album6.id,
 'stock_level' => 54})


 stock1.save
 stock2.save
 stock3.save
 stock4.save
 stock5.save
 stock6.save
