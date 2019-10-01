require "pry"

class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams

    

    def add_team(team)
        User_team.create(user_id:self.id,team_id:team)
    end

    def list_favorite_teams
        fav_teams = User_team.where(user_id:self.id)
        fav_team = fav_teams.map do |team|
            Team.find_by(id:team.team_id).name
        end
        fav_team.each_with_index{|team,index| puts "#{index+1}. #{team}"}
        #puts the team names as listed but returns the team names in an array
    end
end