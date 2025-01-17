require_relative '../config/environment'

def user_login
    puts "First time here? (Yes/No). Type exit to exit app"
    first_time = gets.chomp.downcase #user will input yes or no
    

    if first_time == "yes" 
        #we will look for the user in the db s
        #Call create new user method
        puts ""
        puts "Lets have you create a new username."
        create_user
    elsif first_time == "no"
        #we will create a new user object in the user table
        find_user
    elsif first_time == "exit"
        puts "Goodbye!"
    else 
        puts "Wrong Input Entered! Only accepts Yes or No"
        user_login
        
    end
end



#Create new User method
def create_user
    #will create or find the user in the DB and return the object
    puts "Enter your username"
    input_username = gets.chomp
    if input_username.downcase == "back"
        user_login
    elsif User.find_by(name:input_username)
        puts "Name taken. Please try again. (Input BACK to go back)"
        puts ""
        create_user
    elsif input_username.downcase == "exit"
        puts "Goodbye!"
    #need to search for username
        #if username taken, prompt taken make a new one
    elsif 
        user = User.create(name: input_username)
        system "clear"
        puts "-----------------------------"
        puts "Welcome #{user.name}"
        puts "-----------------------------"
        show_menu
        puts ""
        @current_user = user
        #this saves the user instance for method calls.
        return user 
    else
        create_user
    end
end

#Find returning User method
def find_user
    #will create or find the user in the DB and return the object
    puts "Enter your username:"
    input_username = gets.chomp
 
    if input_username.downcase == "exit"
        puts "Goodbye!"
    elsif 
        user = User.find_by(name: input_username)
        system "clear"
        puts "-----------------------------"
        puts "Welcome back #{user.name}!"
        puts "-----------------------------"
        show_menu
        puts ""
        @current_user = user
        #this saves the user instance for method calls.
        return user
    elsif input_username.downcase == "back"
        system "clear"
        user_login
    else 
        puts "User not found, please try again. (Input BACK to go back)"
        puts ""
        find_user
        #recursion function
    end
end


def show_menu
    puts ""
    puts "--------------- Menu of Commands ---------------------".yellow
    puts "MENU - will display a list of commands.".yellow
    puts "LIST TEAMS - will display all of your teams.".yellow
    puts "ADD TEAM - will add a team to your favorites.".yellow
    puts "DELETE TEAM - will delete a team from your favorites.".yellow
    puts "TEAM RANK - will display the most popular teams.".yellow
    puts "EXIT - will exit the application".yellow
    puts "------------------------------------------------------".yellow
    puts ""
end


def add_team_interface
    puts "Please enter a team"
    team_search = gets.chomp.downcase #gets turns variable into string
    #deleted downcase to match the team names in TEAM SEARCH. Running into errors with captialization.
    if team_search == "back"
        return 
    else
        Team.find_team(team_search) #passing in team_search which is a string variable
    end
end


