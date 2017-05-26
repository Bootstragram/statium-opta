module Statium
  module Opta
    module Model
      class Contestant
        attr_accessor :id
        attr_accessor :clubName
        attr_accessor :type
        attr_accessor :teamType

        def initialize(params)
          params.each do |key, value|
            instance_variable_set("@#{key}", value)
          end
        end
      end
    end
  end
end
