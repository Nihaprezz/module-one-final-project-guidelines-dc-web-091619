require "pry"
class Team < ActiveRecord::Base
    has_many :players
    has_many :user_teams
    has_many :users, through: :user_teams

    def find_team(team_name)
        team=Team.all.find_by(name:"#{team_name}")
        team
    end

    def list_players
        list = Player.where(team_id:self.id)
        #returns an array of the instances
        list
    end

    
end