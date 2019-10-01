class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams



    def add_team
        User_team.create(user_id:self.id,team_id:team.id)
    end


end