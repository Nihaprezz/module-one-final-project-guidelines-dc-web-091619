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
        match_string=RestClient.get("https://api.football-data.org/v2/teams/#{self.team_api_id}/matches?dateFrom=#{week_behind}&dateTo=#{week_forward}", {"X-Auth-Token"=> "ebf9f744f51940048af126de1c5c27b7"})
        match_hash=JSON.parse(match_string)
        match_array = match_hash["matches"]
        match_array.each do |match|
            if match["status"] == "FINISHED"
                puts ""
                puts "Past Fixtures"
                puts "----------"
                puts "#{match["homeTeam"]["name"]}: #{match["score"]["fullTime"]["homeTeam"]}"
                puts "#{match["awayTeam"]["name"]}: #{match["score"]["fullTime"]["awayTeam"]}"
                binding.pry
            elsif match["status"] == "SCHEDULED"
                puts ""
                puts ""
                puts "Upcoming Fixtures"
                puts "-----------------"
                # puts "#{match["utcDate"]}"
                #This doesnt work.
                puts "#{match["homeTeam"]["name"]}"
                puts "#{match["awayTeam"]["name"]}"
                puts ""
            end
        end
    end
    binding.pry 

    # def stats

    # end
    
end
