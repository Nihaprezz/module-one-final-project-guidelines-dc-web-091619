# Soccer CLI App


## Description

Soccer CLI App is a simple, minimalistic, command-line interface program designed for the passionate, busy, modern, working, hipster human being who may not have enough energy left in the day to keep track of his or her favorite soccer teams.  Navigate efforlessly through the interface to register a username, select a team and view the upcoming matches or full squad with the touch of a button. 


## Installation 

### Clone 

-Clone repo into local machine. 

### Setup

```
$ bundle install
```

## Usage

```ruby
afc = #<Team:0x00007f9273c29040 id: 127, name: "AFC Bournemouth", team_api_id: 1044>

afc.list_matches #=> Past Fixtures
                 #=> ----------
                 #=> AFC Bournemouth: 2
                 #=> West Ham United FC: 2

                 #=> Upcoming Fixtures
                 #=> -----------------
                 #=> 2019-10-06
                 #=> Arsenal FC
                 #=> AFC Bournemouth
```

## Support

Ask Sergio or Charlie.

## Roadmap

May potentially widen the scope to other games of foot and ball.

## Contributing

Pull requests are more than welcome.

## Authors and acknowledgment

I'd like to especially thank Sergio for the many hours he has spent deleting the random binding.pry's left in the application during the development phase.

## License