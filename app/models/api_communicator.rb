require "pry"
require "json"
require "rest_client"
require "./config/environment.rb"

$Total_arr = []

# def get_api_info
#     response_string=RestClient.get("https://api.football-data.org/v2/competitions/2021/teams", {"X-Auth-Token"=> ""})
#     response_hash=JSON.parse(response_string)
#     # binding.pry
# end



def all_teams_hashes #only gets teams for 4 leagues
    england_string=RestClient.get("https://api.football-data.org/v2/competitions/2021/standings", {"X-Auth-Token"=> "ebf9f744f51940048af126de1c5c27b7"})
    england_stats=JSON.parse(england_string)['standings'][0]['table']
    spain_string=RestClient.get("https://api.football-data.org/v2/competitions/2014/standings", {"X-Auth-Token"=> "ebf9f744f51940048af126de1c5c27b7"})
    spain_stats=JSON.parse(spain_string)['standings'][0]['table']
    italy_string=RestClient.get("https://api.football-data.org/v2/competitions/2019/standings", {"X-Auth-Token"=> "ebf9f744f51940048af126de1c5c27b7"})
    italy_stats=JSON.parse(italy_string)['standings'][0]['table']
    german_string=RestClient.get("https://api.football-data.org/v2/competitions/2002/standings", {"X-Auth-Token"=> "ebf9f744f51940048af126de1c5c27b7"})
    german_stats=JSON.parse(german_string)['standings'][0]['table']
    $Total_arr = spain_stats + italy_stats + german_stats + england_stats
    binding.pry
end
