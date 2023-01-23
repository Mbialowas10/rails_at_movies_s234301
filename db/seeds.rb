require 'csv'

Movie.delete_all
ProductionCompany.delete_all
Page.delete_all
MovieGenre.delete_all
Genre.delete_all

filename = Rails.root.join('db/top_movies.csv')
puts "Loading Movie the csv file: #{filename}."

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

movies.each do |m|
  production_company = ProductionCompany.find_or_create_by(name: m['production_company'])
  if production_company && production_company.valid?
    # create a movie
    movie = production_company.movies.create(
      title: m['original_title'],
      year: m['year'],
      duration: m['duration'],
      description: m['description'],
      average_vote: m['avg_vote']
    )
    puts "Invalid movie #{m['original_title']}" unless movie&.valid?

    genres = m["genre"].split(",").map(&:strip)

    genres.each do |genre_name|
      genre = Genre.find_or_create_by(name: genre_name)

      MovieGenre.create(movie:movie, genre: genre)
    end
  else
    puts "invalid production company #{m['production_company']} for movie #{m['original_title']}."
  end
end

Page.create(
  title: 'About the Data',
  content: 'The data powering this website was brought to you by Kaggle. ',
  permalink: 'about'
)
Page.create(
  title: 'Contact us',
  content: 'If you dig the website and what to chat more, please reach out to obviously_fake@email.com',
  permalink: 'contact'
)

puts "Created #{ProductionCompany.count} Production Companies"
puts "Created #{Movie.count} movies."
puts "Created #{Genre.count} Genres."
puts "Created #{MovieGenre.count} Movie Genres."