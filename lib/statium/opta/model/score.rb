module Statium
  module Opta
    module Model
      class Score
        attr_accessor :away
        attr_accessor :home

        def initialize(params)
          params.each do |key, value|
            instance_variable_set("@#{key}", value)
          end
        end
      end
    end
  end
end
