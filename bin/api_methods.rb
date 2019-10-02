require_relative '../config/environment'

def create_teams_from_api
    # all_teams_hashes #calls the API we should only be doing this once
    $Total_arr.each do |team|
        Team.create_or_find_by(name: team['name'], team_api_id: team['id'])
    end
end


