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
    end
  end
end
