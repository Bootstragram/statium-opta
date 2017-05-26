module Statium
  module Opta
    module Resource
      class Venue < CommonResource
        attr_accessor :uuid

        def initialize(uuid)
          @uuid = uuid
        end

        def uri(auth_key, lang = 'en')
          specific_options = {
            venue: @uuid
          }
          build_uri('venues', auth_key, nil, common_url_options(lang).merge(specific_options))
        end

        def parse response_body
          Statium::Opta::Model::Venue.build response_body
        end
      end
    end
  end
end
