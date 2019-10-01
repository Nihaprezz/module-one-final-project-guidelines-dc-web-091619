require_relative '../config/environment'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"
require_relative "./cli_methods.rb"

puts ""
puts "Welcome to Sports CLI App"
puts "-------------------------"
puts "Once logged in type Menu for a list of commands"
puts "-------------------------"
puts ""

current_user = user_login

if current_user
    show_menu
    puts "What would you like to do?"
    what_to_do = gets.chomp.downcase
    menu_option_picked(what_to_do)
end


