# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Movie.destroy_all
# List.destroy_all
# Bookmark.destroy_all
# Movie.destroy_all
# puts "creating movies"
# movie_1 = Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# movie_2 = Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# movie_3 = Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# movie_4 = Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
# puts "completed"

# puts "creating list"
# list_1 = List.create(name: "Action")
# list_2 = List.create(name:"Sci-Fi")
# list_3 = List.create(name:"Thriller")
# puts "list created"

# # puts "#{list_1.id}"
# # puts "#{movie_1.id}"

# puts "creating bookmarks"
# Bookmark.create(comment:"All times favorite", movie_id: "#{movie_1.id}", list_id: "#{list_1.id}")
# Bookmark.create(comment:"Need to watch", movie_id: "#{movie_2.id}", list_id: "#{list_3.id}" )
# Bookmark.create(comment:"Oldies", movie_id: "#{movie_3.id}", list_id: "#{list_1.id}")
# Bookmark.create(comment:"5 stars", movie_id: "#{movie_4.id}", list_id: "#{list_2.id}")
# puts "bookmarks created"


require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts "Movies created"
