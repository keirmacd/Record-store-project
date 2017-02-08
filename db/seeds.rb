require('pry-byebug')
require_relative ('../models/artist')
require_relative ('../models/album')
require_relative ('SqlRunner.rb')



@artist1 = Artist.new ({
  "name" => "Reel Big Fish"})
@artist2 = Artist.new ({
  "name" => "Less Than Jake"})
@artist3 = Artist.new ({
  "name" => "Operation Ivy"})

@artist1.save
@artist2.save
@artist3.save


@album1 = Album.new({
  "title" => "Monkeys for nothing, chimps for free", 
  "genre" => "ska-punk", 
  "artist_id" => @artist1.id
})
@album2 = Album.new({
  "title" => "Hello Rockview", 
  "genre" => "ska-punk", 
  "artist_id" => @artist2.id
})
@album3 = Album.new({
  "title" => "Operation Ivy", 
  "genre" => "Ska", 
  "artist_id" => @artist3.id
})


@album1.save
@album2.save
@album3.save

binding.pry
nil
