require "date"
require "pry"
class Team < ActiveRecord::Base
    has_many :players
    has_many :user_teams
    has_many :users, through: :user_teams

    def self.find_team(team_name)
            found_team=self.all.select{|team|team.name.casecmp(team_name)==0}.first
            
            if team_name == "back"
                return
            elsif !found_team
                puts "Team not found.  Please enter again. (BACK to go back)"
                team_name = gets.chomp.downcase
                self.find_team(team_name)
            elsif found_team.is_a?(Object)
                found_team.id
            end

    end

    def matches
        week_behind=(Date.today-14).strftime('%Y-%m-%d')
        week_forward=(Date.today+14).strftime('%Y-%m-%d')
        match_string=RestClient.get("https://api.football-data.org/v2/teams/#{self.team_api_id}/matches?dateFrom=#{week_behind}&dateTo=#{week_forward}", {"X-Auth-Token"=> "ebf9f744f51940048af126de1c5c27b7"})
        match_hash=JSON.parse(match_string)
        match_array = match_hash["matches"]
    end

    def list_matches
        self.matches.each do |match|
            if match["status"] == "FINISHED"
                puts ""
                puts "Past Fixtures"
                puts "----------"
                puts "#{match["competition"]["name"]}"
                puts "#{match["utcDate"].split('T').shift}"
                puts ""
                puts "#{match["awayTeam"]["name"]}: #{match["score"]["fullTime"]["awayTeam"]}"
                puts "at"
                puts "#{match["homeTeam"]["name"]}: #{match["score"]["fullTime"]["homeTeam"]}"
            elsif match["status"] == "SCHEDULED"
                puts ""
                puts ""
                puts "Upcoming Fixtures"
                puts "-----------------"
                puts "#{match["competition"]["name"]}"
                puts "#{match["utcDate"].split('T').shift}"
                puts ""
                puts "#{match["awayTeam"]["name"]}"
                puts "at"
                puts "#{match["homeTeam"]["name"]}"
                puts ""
            end
        end
    end

    def players
        players_string=RestClient.get("https://api.football-data.org/v2/teams/#{self.team_api_id}", {"X-Auth-Token"=> "f4350053fbe442b99d59c69baf7630e1"})
        players_hash=JSON.parse(players_string)
        players_arr = players_hash["squad"]
    end

    def list_players
        puts ""
        puts "#{self.name} Players"
        self.players.each do |player| 
            puts ""
            puts "#{player["role"]}: #{player["name"]}"
            puts "Position: #{player["position"]}"
            puts "Age: #{((Date.today-Date.parse(player["dateOfBirth"]))/365).to_i}"
            puts "Nationality: #{player["nationality"]}"
            puts "No. #{player["shirtNumber"]}"
            puts ""
        end
    end

    def self.fav_team_options(team_name)
        found_id = self.find_team(team_name)
        found_team = self.find_by(id: found_id)

        found_team.show_stats   #will show the stats

        prompt = TTY::Prompt.new
        selected = prompt.enum_select("Choose what details you would like to see:", "Club Players", "Matches")

        if selected == "Matches"
            found_team.list_matches
        elsif selected == "Club Players"
            found_team.list_players
        end
    end

    def show_stats
      stats_object = Stat.find_by(team_api_id: self.team_api_id)
      puts "#{self.name} Team Stats".red
      puts "------------------------"
      puts "Position: #{stats_object.standing} | Wins: #{stats_object.wins} | Draws: #{stats_object.draws} | Losses: #{stats_object.losses} Goals For: #{stats_object.goals_for} | Goals Against: #{stats_object.goals_against}".red
      puts "-------------------------"
    end
    
end
