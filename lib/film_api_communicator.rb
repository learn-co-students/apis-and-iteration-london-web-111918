require 'rest-client'
require 'json'
require 'pry'

def make_film_search
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  JSON.parse(response_string)
end

def return_film_results(result, film_name)
result["results"].collect do |film|
  if film["title"] == film_name
    puts "Title : #{film["title"]}"
    puts "Episode ID : #{film["episode_id"]}"
    puts "Director : #{film["director"]}"
    puts "Producer : #{film["producer"]}"
    puts "Release Date : #{film["release_date"]}"
  end
end
end

def show_film_details(film)
  result = make_film_search
  return_film_results(result, film)
  # print_movies(films_array)
end
