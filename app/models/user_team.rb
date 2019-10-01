class User_team < ActiveRecord::Base
#is it User_teams?
    has_one :user
    has_one :team
    has_many :players, through: :team
    #team or teams?
end