#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/film_api_communicator.rb"

welcome
key_choice = character_or_film
until key_choice == "c" || key_choice == "f" do
  key_choice = character_or_film
end
if key_choice == "c"
  character = get_character_from_user
  show_character_movies(character)
elsif key_choice == "f"
  film = get_film_from_user
  show_film_details(film)
end
