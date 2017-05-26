module Statium
  module Opta
    module Model
      class Venue
        attr_accessor :id
        attr_accessor :name
        attr_accessor :city
        attr_accessor :countryId
        attr_accessor :country
        attr_accessor :countryCode
        attr_accessor :address
        attr_accessor :opened
        attr_accessor :capacity
        attr_accessor :surface
        attr_accessor :mapsGeoCodeLatitude
        attr_accessor :mapsGeoCodeLongitude
        attr_accessor :contestants

        def self.build params
          venues = params["venue"]
          raise "Invalid number of venues" unless venues.count == 1
          return Statium::Opta::Model::Venue.new(venues[0])
        end

        def initialize(params)
          params.each do |key, value|
            instance_variable_set("@#{key}", value)
          end

          @contestants = []
          if params["contestant"] != nil
            params["contestant"].each do |contestant_params|
              @contestants << Contestant.new(contestant_params)
            end
          end
        end
      end
    end
  end
end
