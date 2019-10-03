require 'faker'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"

# # Team.destroy_all - I dont want to destroy teams 


#Users
sergio = User.find_or_create_by(name: "Sergio") #will have at least 6 teams
charlie = User.find_or_create_by(name: "Charlie")  #will have at least 3 teams
sam = User.find_or_create_by(name: "Sam")  #will have at least 2 teams
harry = User.find_or_create_by(name: "Harry")  #will have 1 team
franklin = User.find_or_create_by(name: "Franklin")    #will have 4 teams
johnny = User.find_or_create_by(name: "Johnny")    #will have 1 team
