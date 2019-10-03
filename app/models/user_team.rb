class User_team < ActiveRecord::Base
    belongs_to :user 
    belongs_to :team
    has_many :players, through: :team

    def self.team_count_hash
        count_hash = {}
        self.all.each do |user_team|
            count_hash[user_team.team_id] ? count_hash[user_team.team_id]+=1 : count_hash[user_team.team_id]=1
        end
        count_hash
    end

    def self.most_popular_team
        most_pop=self.team_count_hash.max_by{|id,num|num}
        prints "#{Team.find_by(id:most_pop[0]).name}"
    end

end