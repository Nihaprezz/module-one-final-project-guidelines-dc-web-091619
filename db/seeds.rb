require 'faker'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"

# # Team.destroy_all - I dont want to destroy teams 


#Users
sergio = User.create(name: "Sergio") #will have at least 6 teams
charlie = User.create(name: "Charlie")  #will have at least 3 teams
sam = User.create(name: "Sam")  #will have at least 2 teams
harry = User.create(name: "Harry")  #will have 1 team
franklin = User.create(name: "Franklin")    #will have 4 teams
johnny = User.create(name: "Johnny")    #will have 1 team


