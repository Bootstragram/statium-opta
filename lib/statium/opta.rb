require "statium/opta/version"
require "json"

# Home of the documentation
# http://api.performfeeds.com/soccerdata/matchstats/sdapidocumentation?_docu#

module Statium
  module Opta
    autoload :Client, 'statium/opta/client'

    module Model
      autoload :Venue, 'statium/opta/model/venue'
      autoload :Contestant, 'statium/opta/model/contestant'
      autoload :Competition, 'statium/opta/model/competition'
      autoload :TournamentCalendar, 'statium/opta/model/tournament_calendar'
      autoload :Match, 'statium/opta/model/match'
      autoload :MatchInfo, 'statium/opta/model/match_info'
      autoload :LiveData, 'statium/opta/model/live_data'
      autoload :MatchDetails, 'statium/opta/model/match_details'
      autoload :Scores, 'statium/opta/model/scores'
      autoload :Score, 'statium/opta/model/score'
    end
  end
end
