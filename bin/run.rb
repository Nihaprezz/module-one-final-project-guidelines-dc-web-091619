require_relative '../config/environment'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"
require_relative "./cli_methods.rb"

puts "

_______  _______  _______  _______  _______  ______      _______  ___      ___     _______  _______  _______ 
|       ||       ||       ||       ||       ||    _ |    |       ||   |    |   |   |   _   ||       ||       |
|  _____||   _   ||       ||       ||    ___||   | ||    |       ||   |    |   |   |  |_|  ||    _  ||    _  |
| |_____ |  | |  ||       ||       ||   |___ |   |_||_   |       ||   |    |   |   |       ||   |_| ||   |_| |
|_____  ||  |_|  ||      _||      _||    ___||    __  |  |      _||   |___ |   |   |       ||    ___||    ___|
 _____| ||       ||     |_ |     |_ |   |___ |   |  | |  |     |_ |       ||   |   |   _   ||   |    |   |    
|_______||_______||_______||_______||_______||___|  |_|  |_______||_______||___|   |__| |__||___|    |___|    

"
puts "-------------------------"
puts "Once logged in type Menu for a list of commands"

current_user = user_login

# if current_user
#     show_menu
#     puts "What would you like to do?"
#     what_to_do = gets.chomp.downcase
#     menu_option_picked(what_to_do)
# end



# if current_user
#     show_menu
#     puts "What would you like to do?"
#     what_to_do = gets.chomp.downcase
#     menu_option_picked(what_to_do)
# end


if @current_user
    while true do
        # show_menu
        puts "What would you like to do?"
        choice = gets.chomp.downcase
            case choice
            when "menu"
            show_menu
            when "list teams"
                @current_user.print_fav_teams
            when "add team"
                new_team_id = add_team_interface
                @current_user.add_team(new_team_id)
            when "delete team"
                ##call delete team method
                puts ''
                @current_user.print_fav_teams
                puts ''
                puts "Choose a team to delete."
                team_to_delete = gets.chomp  
                #call the delete method     
                @current_user.delete_team(team_to_delete)
            when "exit"
                puts "Goodbye!"
                break
end

    end
end