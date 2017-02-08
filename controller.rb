require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative  ('./models/artist.rb')
require_relative  ('./models/album.rb')


get '/' do
  "Hello World"
end

get "/index" do
  @albums = Album.all()
  erb (:index)
end

