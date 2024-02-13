response = URI.open("https://tmdb.lewagon.com/movie/top_rated")
json = JSON.parse(response.read)



puts "Cleaning database..."
Bookmark.destroy_all
Review.destroy_all
List.destroy_all
Movie.destroy_all

puts "Creating movie..."

json['results'].each do |entry|
  movie = Movie.create!(
    title: entry['title'],
    overview: entry['overview'],
    rating: entry['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['backdrop_path']}"
  )

  puts "Created #{movie.title}"
end

puts "Finished!"
