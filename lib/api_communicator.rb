require 'rest-client'
require 'json'
require 'pry'



def get_character_movies_from_api(character_name)
  #make the web request
  film_array = []
  response_hash = turn_to_json('http://www.swapi.co/api/people/')
  character_array = response_hash["results"]
  character_array.each do |item|
    if item["name"].downcase == character_name
      films = item["films"]
      films.each do |film|
        film_array << turn_to_json(film)
      end
    end
  end
  film_array
end
  # response_hash.map ||

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films)
  films.each_with_index do |titles, index|
    puts "#{index + 1}. #{titles["title"]}"
  end
end


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

def turn_to_json(api)
  JSON.parse(RestClient.get(api))
end
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
