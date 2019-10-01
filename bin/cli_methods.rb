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
    puts "List Teams - will display all of your teams."
    puts "Add Team - will add a team to your favorites."
    puts "Delete Team - will delete a team from your favorites."
    puts "Exit - will exit the application"
    puts "------------------------------------------------------"
    puts ""
end


