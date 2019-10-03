require_relative '../config/environment'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"
require_relative "../bin/cli_methods.rb"

RSpec.describe "Team" do

    it "returns 108 if team_name is ARSENAL" do
        expect(Team.find_team("ARSENAL FC")).to be(108)
    end

    

end