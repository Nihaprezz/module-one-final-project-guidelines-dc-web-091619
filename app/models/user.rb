require "pry"

class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams

    

    def add_team(team)
        User_team.create(user_id:self.id,team_id:team)
    end

    def list_favorite_teams
        fav_team = User_team.where(user_id:self.id)
        fav_team = fav_team.map do |team|
            Team.find_by(id:team.team_id)
        end
        fav_team
        #returns the team instances in an array.
    end
    
end