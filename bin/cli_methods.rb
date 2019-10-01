require_relative '../config/environment'
# require_relative "../app/models/player.rb"
# require_relative "../app/models/team.rb"
# require_relative "../app/models/user_team.rb"
# require_relative "../app/models/user.rb"

def user_login
    puts "First time here? (Yes/No). Type exit to exit app"
    first_time = gets.chomp.downcase #user will input yes or no
    

    if first_time == "yes" 
        #we will look for the user in the db 
        #Call create new user method
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
        return new_user 
    end
end



