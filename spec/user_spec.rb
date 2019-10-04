require_relative '../config/environment'
require_relative "../app/models/player.rb"
require_relative "../app/models/team.rb"
require_relative "../app/models/user_team.rb"
require_relative "../app/models/user.rb"
require_relative "../bin/cli_methods.rb"

RSpec.describe "User" do

    it "returns array for User.find_by(name:'Sergio')" do
        expect(User.find_by(name:'Sergio').list_favorite_teams).to be_a(Array)
    end

    # it "deletes a team instance from User's favorite teams list" do
    #     expect(<User:0x00007f9de597b550 id: 59, name: "Sergio">.delete_team("team_name")).to change(<User:0x00007f9de597b550 id: 59, name: "Sergio">.list_favorite_teams.count).by(1)
    # end

end