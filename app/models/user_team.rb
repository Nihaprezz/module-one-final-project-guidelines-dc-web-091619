class User_team < ActiveRecord::Base
    belongs_to :user 
    belongs_to :team
    has_many :players, through: :team
end