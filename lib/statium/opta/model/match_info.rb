module Statium
  module Opta
    module Model
      class MatchInfo
        attr_accessor :competition
        attr_accessor :contestants
        attr_accessor :date
        attr_accessor :description
        attr_accessor :id
        attr_accessor :lastUpdated
        attr_accessor :ruleset
        attr_accessor :sport
        attr_accessor :stage
        attr_accessor :time
        attr_accessor :tournamentCalendar
        attr_accessor :venue
        attr_accessor :week

        def initialize(params)
          params.each do |key, value|
            instance_variable_set("@#{key}", value)
          end
        end
      end
    end
  end
end
