# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri' # Allows us to send GET requests and receive the response
require 'json' # Allows us to parse the reponse into a JSON object/hash
puts "Cleans up everything from database"
Movie.destroy_all
puts "Start seeding new movies"
# query given link
url = 'http://tmdb.lewagon.com/movie/top_rated'

10.times do |i|
	# we need to scan 10 pages
	puts "Importing movies from page #{i + 1}"
	# recieved JSON
	data = URI.open("#{url}?page=#{i + 1}").read
	# .parse on our response object will parse the JSON into a JSON hash That we can treat as Ruby hash.
	# spacify that we need value of key 'results'-----an array of hashes
	movies = JSON.parse(data)['results']
	# create movies
	base_url = "https://image.tmdb.org/t/p/original"
	movies.each do |movie|
		puts "Creating #{movie['title']}"
		Movie.create(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "#{base_url}#{movie['backdrop_path']}")

	end
end

puts "Movies created. Seed file completed"
