require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative  "./models/artist.rb"
require_relative  "./models/album.rb"


get '/' do
"you took the red pill"
end

get "/index" do
  @albums = Album.all()
  erb :index
end

