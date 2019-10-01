require 'faker'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"

Player.destroy_all
Team.destroy_all
# User.destroy_all
# User_team.destroy_all





##Users
user1=User.create(name:Faker::Name.name)
user2=User.create(name:Faker::Name.name)
user3=User.create(name:Faker::Name.name)
user4=User.create(name:Faker::Name.name)
user5=User.create(name:Faker::Name.name)
user6=User.create(name:Faker::Name.name)
user7=User.create(name:Faker::Name.name)
user8=User.create(name:Faker::Name.name)


##User_teams
user_team1=User_team.create()
user_team2=User_team.create()
user_team3=User_team.create()
user_team4=User_team.create()
user_team5=User_team.create()
user_team6=User_team.create()
user_team7=User_team.create()
user_team8=User_team.create()

##teams
team1=Team.create(name:Faker::Sports::Football.team)
team2=Team.create(name:Faker::Sports::Football.team)
team3=Team.create(name:Faker::Sports::Football.team)
team4=Team.create(name:Faker::Sports::Football.team)
team5=Team.create(name:Faker::Sports::Football.team)
team6=Team.create(name:Faker::Sports::Football.team)
team7=Team.create(name:Faker::Sports::Football.team)
team8=Team.create(name:Faker::Sports::Football.team)
g
##players
 player1=Player.create(name:Faker::Sports::Football.player, team_id:team1.id)
 player2=Player.create(name:Faker::Sports::Football.player, team_id:team2.id) 
 player3=Player.create(name:Faker::Sports::Football.player, team_id:team3.id)
 player4=Player.create(name:Faker::Sports::Football.player, team_id:team4.id)
 player5=Player.create(name:Faker::Sports::Football.player, team_id:team5.id)
 player6=Player.create(name:Faker::Sports::Football.player, team_id:team6.id) 
 player7=Player.create(name:Faker::Sports::Football.player, team_id:team7.id)
 player8=Player.create(name:Faker::Sports::Football.player, team_id:team8.id)