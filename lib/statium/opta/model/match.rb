module Statium
  module Opta
    module Model
      class Match
        attr_accessor :liveData
        attr_accessor :matchInfo

        def self.build params
          all_matches = []
          params["match"].each do |match_params|
            all_matches << Match.new(match_params)
          end
          all_matches
        end

        def initialize(params)
          @matchInfo = MatchInfo.new(params['matchInfo'])
          @liveData = LiveData.new(params['liveData'])
        end
      end
    end
  end
end
