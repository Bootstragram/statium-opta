module Statium
  module Opta
    module Model
      class TournamentCalendar
        attr_accessor :active
        attr_accessor :endDate
        attr_accessor :id
        attr_accessor :lastUpdated
        attr_accessor :name
        attr_accessor :ocId
        attr_accessor :startDate

        def initialize(params)
          params.each do |key, value|
            instance_variable_set("@#{key}", value)
          end
        end

        def to_s
          "#{name} from #{startDate} to #{endDate} - #{id} (#{super.to_s})"
        end
      end
    end
  end
end
