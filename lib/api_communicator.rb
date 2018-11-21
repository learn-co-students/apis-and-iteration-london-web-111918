require 'rest-client'
require 'json'
require 'pry'


def make_people_search
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  JSON.parse(response_string)
end

def return_results(result, character_name)
result["results"].collect do |people|
    if people["name"] == character_name
      films = people["films"]
    end
    return films
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

def show_character_movies(character)
  result = make_people_search
  films_array = return_results(result, character)
  print_movies(films_array)
end








  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.







## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
