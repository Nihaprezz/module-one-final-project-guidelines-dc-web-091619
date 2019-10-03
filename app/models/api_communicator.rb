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
    england_string=RestClient.get("https://api.football-data.org/v2/competitions/2021/teams", {"X-Auth-Token"=> "ebf9f744f51940048af126de1c5c27b7"})
    england_arr=JSON.parse(england_string)["teams"]
    spain_string=RestClient.get("https://api.football-data.org/v2/competitions/2014/teams", {"X-Auth-Token"=> ""})
    spain_arr=JSON.parse(spain_string)["teams"]
    italy_string=RestClient.get("https://api.football-data.org/v2/competitions/2019/teams", {"X-Auth-Token"=> ""})
    italy_arr=JSON.parse(italy_string)["teams"]
    german_string=RestClient.get("https://api.football-data.org/v2/competitions/2002/teams", {"X-Auth-Token"= ""> "ebf9f744f51940048af126de1c5c27b7"})
    german_arr=JSON.parse(german_string)["teams"]
    $Total_arr = spain_arr + italy_arr + german_arr + england_arr
end
