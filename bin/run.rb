require_relative '../config/environment'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"
require_relative "./cli_methods.rb"


puts "Welcome to Sports CLI App"
puts "-------------------------"
puts "Once logged in type Menu for a list of commands"
puts "-------------------------"

current_user = user_login

User.first.list_favorite_teams
