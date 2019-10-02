require "pry"
class Team < ActiveRecord::Base
    has_many :players
    has_many :user_teams
    has_many :users, through: :user_teams

    def self.find_team(team_name)
        # found_team = self.find_by(name: team_name)
        found_team=self.all.select{|team|team.name.casecmp(team_name)==0}.first
        found_team.id 
    end

    def list_players
        list = Player.where(team_id:self.id)
        #returns an array of the instances
        list
    end

    def matches
        week_behind=(Date.today-7).strftime('%Y-%m-%d')
        week_forward=(Date.today+7).strftime('%Y-%m-%d')
        match_string=RestClient.get("https://api.football-data.org/v2/teams/1044/matches?dateFrom=#{week_behind}&dateTo=#{week_forward}", {"X-Auth-Token"=> "######TOP SECRET#########"})
        match_hash=JSON.parse(match_string)
        @match_array = match_hash["matches"]
    end

    # def stats

    # end
    
end
