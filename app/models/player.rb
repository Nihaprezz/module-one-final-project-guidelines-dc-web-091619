class Player < ActiveRecord::Base
    has_one :team
    has_many :user_teams, through: :team



    
end