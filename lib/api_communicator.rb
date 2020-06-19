require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  array = []
  response_hash.each do | data, attr |
    if data == "results"
      attr.each do | hash |
        hash.each do | k, v |
          #binding.pry
          if v == "#{character}".split.map(&:capitalize).join(' ')
            #binding.pry
            array << hash["films"]
          end
        end
      end
    end
  end
  array
  #binding.pry

  films = []
  #binding.pry
  array[0].each do |element|
    #binding.pry
    response_string2 = RestClient.get(element)
    response_hash2 = JSON.parse(response_string2)
    movie_hash = {}
    movie_hash["title"] = response_hash2["title"]
    movie_hash["opening text"] = response_hash2["opening_crawl"]
    movie_hash["date"] = response_hash2["release_date"]
    films << movie_hash
  end
films
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



def print_movies(films)
  films.each do | film_name |
    #binding.pry

    puts "---------------------------------------------"
    film_name.each do | k, v |
      if k == "title"
        puts "Title: #{v}"
      end
      if k == "date"
        puts "Date: #{v}"
      end
      if k == "opening text"
        #binding.pry
        string = "Opening Crawl: " + "#{v}"
        puts string.gsub("\r\n\r\n"," ").gsub("\r\n \r\n"," ").gsub("\r\n"," ")[0..150] + "..."
      end
    end
  end
  # some iteration magic and puts out the movies in a nice list
end




def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
