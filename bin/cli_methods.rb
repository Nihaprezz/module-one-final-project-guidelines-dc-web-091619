require_relative '../config/environment'

def user_login
    puts "First time here? (Yes/No). Type exit to exit app"
    first_time = gets.chomp.downcase #user will input yes or no
    

    if first_time == "yes" 
        #we will look for the user in the db 
        #Call create new user method
        puts ""
        puts "Lets have you create a new username."
        find_or_create_user
    elsif first_time == "no"
        #we will create a new user object in the user table
        find_or_create_user
    elsif first_time == "exit"
        puts "Goodbye!"
    else 
        puts "Wrong Input Entered! Only accepts Yes or No"
        user_login
        
    end
end



#Create new User method
def find_or_create_user
    system "clear"
    #will create or find the user in the DB and return the object
    puts "Enter your username"
    input_username = gets.chomp
 
    if input_username.downcase == "exit"
        puts "Goodbye!"
    else 
        new_user = User.find_or_create_by(name: input_username)

        puts "-----------------------------"
        puts "Welcome #{new_user.name}"
        puts "-----------------------------"
        puts ""
        @current_user = new_user
        #this saves the user instance for method calls.
        return new_user 
    end
end


# Menu of Commands:
# List Teams (display all teams in the user_team table for that specific user)

# Add  Team(user would enter team name and we would look for team name in the team table and create a new “user_team”)

# Delete Team (list all your teams and the user would type the team name and we would look in the joiner table to delete it)

def show_menu
    puts ""
    puts "--------------- Menu of Commands ---------------------"
    puts "LIST TEAMS - will display all of your teams."
    puts "ADD TEAM - will add a team to your favorites."
    puts "DELETE TEAM - will delete a team from your favorites."
    puts "EXIT - will exit the application"
    puts "------------------------------------------------------"
    puts ""
end

# def menu_option_picked(input)
#     #case thing
#     case input
#     when "list teams"
#         @current_user.print_fav_teams
#     when "add team"
#         new_team_id = add_team_interface
#         @current_user.add_team(new_team_id)
#     when "delete team"
#         ##call delete team method
#         puts ''
#         @current_user.print_fav_teams
#         puts ''
#         puts "Choose a team to delete."
#         team_to_delete = gets.chomp  
#         #call the delete method     

#         @current_user.delete_team(team_to_delete)
#     when "exit"
#         #will return goodbye message"
#     end
# end

def add_team_interface
    puts "Please enter a team"
    team_search = gets.chomp.capitalize #gets turns variable into string
    #deleted downcase to match the team names in TEAM SEARCH. Running into errors with captialization.
    Team.find_team(team_search) #passing in team_search which is a string variable
end


