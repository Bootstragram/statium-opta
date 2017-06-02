module Statium
  module Opta
    module Model
      class Scores
        attr_accessor :ft
        attr_accessor :total

        def initialize(params)
          @ft = Score.new(params['ft'])
          @total = Score.new(params['total'])
        end
      end
    end
  end
end
