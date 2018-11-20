# require 'rest-client'
# require 'json'
# require 'pry'
#
# # iterate over the response hash to find the collection of `films` for the given
# #   `character`
# # collect those film API urls, make a web request to each URL to get the info
# #  for that film
# # return value of this method should be collection of info about each film.
# #  i.e. an array of hashes in which each hash reps a given film
# # this collection will be the argument given to `print_movies`
# #  and that method will do some nice presentation stuff like puts out a list
# #  of movies by title. Have a play around with the puts with other info about a given film.
#
# def get_character_movies_from_api(character_name)
#   #make the web request
#   response_string = RestClient.get('http://www.swapi.co/api/people/')
#   response_hash = JSON.parse(response_string)
#   response_hash["results"].map do |element|
#     if element["name"] == character_name
#       element["films"]
#     end
#   end
# end
#
#
# # def get_film_data(film_url_array)
# #
# #     film_string = RestClient.get('http://www.swapi.co/api/films/')
# #     film_hash = JSON.parse(film_string)
# #
# #     film_hash["results"].map do |element|
# #       if film_url_array.include?(element["url"])
# #       end
# #     end
# #   end
#
#
# def parse_films(film_url_array)
#   film_url_array = film_url_array.flatten
#   binding.pry
#   list_of_films = []
#   film_url_array.each do |film|
#     film_string = RestClient.get("#{film}")
#     film_hash = JSON.parse(film_string)
#     list_of_films << film_hash
#   end
#   list_of_films
# end
#
#
# # def parse_films(films)
# #   film_string = RestClient.get('http://www.swapi.co/api/#{films}/')
# #   film_hash = JSON.parse(film_string)
# #   binding.pry
# #     if film_url_array.include?(films)
# #
# #     end
# # end
# #
# # parse_films()
#
# # def print_movies(films)
# #   films = films.flatten
# #   binding.pry
# #   # some iteration magic and puts out the movies in a nice list
# #   film_string = RestClient.get("http://www.swapi.co/api/#{films}/")
# #     film_hash = JSON.parse(film_string)
# #     binding.pry
# #     film_hash["results"].map do |element|
# #       element["url"] == films
# #       element["title"]
# #     end
# # end
#
# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   parse_films(films)
# end
#
# ## BONUS
#
# # that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# # can you split it up into helper methods?
