require 'rest-client'
require 'json'
require 'pry'

def make_search
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  JSON.parse(response_string)
end

def return_results(result, film_name)
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

def print_movies(films_array)
counter = 1
  films_array.each do |url|
    response_string = RestClient.get(url)
    info = JSON.parse(response_string)
    puts "#{counter}. #{info["title"]}"
    counter += 1
  end
end

def show_film_details(film)
  result = make_search
  return_results(result, film)
  # print_movies(films_array)
end
