def welcome
  puts "welcome"
end

def character_or_film
  puts "Press c to search characters or f to search films"
  gets.chomp
end

def get_character_from_user
  puts "please enter a character name"
  gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_film_from_user
  puts "please enter a film name"
  gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end
