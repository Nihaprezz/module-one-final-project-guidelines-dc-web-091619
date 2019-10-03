require "pry"

class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams

    def add_team(team)
        if team 
            User_team.find_or_create_by(user_id:self.id,team_id:team)
            puts "Favorites changed"
        else 
            return
        end
    end

    def list_favorite_teams
        fav_team = User_team.where(user_id:self.id)
        fav_team = fav_team.map do |team|
            Team.find_by(id:team.team_id)
        end
        fav_team
        #returns the team instances in an array.
    end

    def print_fav_teams
        list_favorite_teams.each_with_index{ |value, index| puts "#{index+1}. #{value.name}"}
    end


    def delete_team(team_name)
        #find his objects in the user_team table
        returned_id=Team.find_team(team_name)
        User_team.where(user_id: self.id).destroy_by(team_id: returned_id)
    end

    def print_ttyl_team_list
        prompt = TTY::Prompt.new
        list_text = "Select a Team or Go Back to Menu"
        fav_teams = self.list_favorite_teams

        prompt.enum_select(list_text, fav_teams.map {|team| team.name}, "Menu")

    end
    
end