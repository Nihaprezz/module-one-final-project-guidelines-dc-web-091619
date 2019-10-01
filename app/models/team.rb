class Team < ActiveRecord::Base
    has_many :players
    has_many :user_teams
    has_many :users, through: :user_teams

    def find_team(team_name)
        team=Team.all.find_by(name:"#{team_name}")
        team
    end

    
end