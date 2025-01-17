require_relative '../config/environment'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"
require_relative "./cli_methods.rb"

puts "


_______  _______  _______  _______  _______  ______      _______  _______  _______ 
|       ||       ||       ||       ||       ||    _ |    |   _   ||       ||       |
|  _____||   _   ||       ||       ||    ___||   | ||    |  |_|  ||    _  ||    _  |
| |_____ |  | |  ||       ||       ||   |___ |   |_||_   |       ||   |_| ||   |_| |
|_____  ||  |_|  ||      _||      _||    ___||    __  |  |       ||    ___||    ___|
 _____| ||       ||     |_ |     |_ |   |___ |   |  | |  |   _   ||   |    |   |    
|_______||_______||_______||_______||_______||___|  |_|  |__| |__||___|    |___|    

(2019 Version.)
".blue

puts "-------------------------"
puts "Once logged in type Menu for a list of commands".blue

current_user = user_login

if @current_user
    while true do
        # show_menu
        puts "What would you like to do? (Type MENU for options)".yellow
        choice = gets.chomp.downcase
            case choice
            when "menu"
                system "clear"
                show_menu
            when "list teams"
                system "clear"
                puts ''
                puts "Favorite Teams"
                puts "---------------"
                #will call the the ttyl prompt method in user
                selected_team = @current_user.print_ttyl_team_list
                system 'clear'
                if selected_team != "Menu"
                    Team.fav_team_options(selected_team)
                end
                puts ''
                puts ''
                puts ''
            when "add team"
                new_team_id = add_team_interface
                @current_user.add_team(new_team_id)
            when "team rank"
                puts "Team rankings"
                puts "-------------"
                User_team.most_popular_teams
            when "delete team"
                ##call delete team method
                puts ''
                @current_user.print_fav_teams
                puts ''
                puts "Choose a team to delete."
                team_to_delete = gets.chomp  
                #call the delete method     
                @current_user.delete_team(team_to_delete)
            when "popular team"
                system "clear"
                User_team.most_popular_team
            when "exit"
                puts "GoodBye! Thank you for using the app!"
                break
            end

    end
end