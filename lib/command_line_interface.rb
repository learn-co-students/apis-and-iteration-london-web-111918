def welcome
  # puts out a welcome message here!
  puts "May the Force be with you!"
end

def get_character_from_user
  puts "Please enter a character name:"
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
