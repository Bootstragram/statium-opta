module Statium
  module Opta
    module Model
      class MatchDetails
        attr_accessor :matchStatus
        attr_accessor :matchTime
        attr_accessor :scores

        def initialize(params)
          params.each do |key, value|
            instance_variable_set("@#{key}", value)
          end

          if params['scores']
            @scores = Scores.new(params['scores'])
          end
        end
      end
    end
  end
end
