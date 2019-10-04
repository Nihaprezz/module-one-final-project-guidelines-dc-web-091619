class User_team < ActiveRecord::Base
    belongs_to :user 
    belongs_to :team
    has_many :players, through: :team

    def self.team_count_hash
        count_hash = {}
        self.all.each do |user_team|
            count_hash[user_team.team_id] ? count_hash[user_team.team_id]+=1 : count_hash[user_team.team_id]=1
        end
        count_hash=count_hash.sort_by{|key,value|-value}[0..5]
    end

    def self.most_popular_teams
        self.team_count_hash.each_with_index do |arr, index|
            puts "#{index+1}. #{Team.find(arr[0]).name}: #{arr[1]} followers"
        end
    end

end