module Statium
  module Opta
    module Model
      class LiveData
        attr_accessor :matchDetails

        def initialize(params)
          @matchDetails = MatchDetails.new(params['matchDetails'])
        end
      end
    end
  end
end
