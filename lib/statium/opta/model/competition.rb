module Statium
  module Opta
    module Model
      class Competition
        attr_accessor :id
        attr_accessor :ocId
        attr_accessor :opId
        attr_accessor :name
        attr_accessor :country
        attr_accessor :countryId
        attr_accessor :isFriendly
        attr_accessor :competitionFormat
        attr_accessor :type
        attr_accessor :tournamentCalendars

        def self.build params
          all_competitions = []
          params["competition"].each do |competition_params|
            all_competitions << Competition.new(competition_params)
          end
          all_competitions
        end

        def initialize(params)
          params.each do |key, value|
            instance_variable_set("@#{key}", value)
          end

          @tournamentCalendars = []
          if params["tournamentCalendar"] != nil
            params["tournamentCalendar"].each do |tournament_calendar_params|
              @tournamentCalendars << TournamentCalendar.new(tournament_calendar_params)
            end
          end
        end

        def to_s
          return "#{name} - #{id} (#{super.to_s})"
        end
      end
    end
  end
end
