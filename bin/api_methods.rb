require_relative '../config/environment'

# def create_teams_from_api
#     # all_teams_hashes #calls the API we should only be doing this once
#     $Total_arr.each do |team|
#         Team.create_or_find_by(name: team['name'], team_api_id: team['id'])
#     end
# end

def create_stat_team_data
    # all_teams_hashes <---- calls the API we should only to this once when seeding the data
    
    $Total_arr.each do |team|
        Stat.create_or_find_by(
            team_api_id: team['team']['id'],
            team_name: team['team']['name'],
            wins: team['won'],
            draws: team['draw'],
            losses: team['lost'],
            goals_for: team['goalsFor'],
            goals_against: team['goalsAgainst'],
            standing: team['position'],
        )
    end
end




