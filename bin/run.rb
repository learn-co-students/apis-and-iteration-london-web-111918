#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/film_api_communicator.rb"

welcome
choice = character_or_film
until choice == "c" || choice == "f" do
  choice = character_or_film
end
if choice == "c"
  character = get_character_from_user
  show_character_movies(character)
elsif choice == "f"
  film = get_film_from_user
  show_film_details(film)
end
