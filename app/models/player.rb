class Player < ActiveRecord::Base
    belongs_to :team
    has_many :user_teams, through: :team    
end