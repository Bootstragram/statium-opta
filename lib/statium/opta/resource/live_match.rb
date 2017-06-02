module Statium
  module Opta
    module Resource
      class LiveMatch < CommonResource
        attr_accessor :tournament_calendar_uuid

        def initialize(tournament_calendar_uuid, page_number = 1, page_size = 500)
          @tournament_calendar_uuid = tournament_calendar_uuid
          @page_number = page_number
          @page_size = page_size
        end

        def uri(auth_key, lang = 'en')
          specific_options = {
            tmcl: @tournament_calendar_uuid,
            live: 'yes',
            lineups: 'yes',
            status: 'playing',
            _pgSz: @page_size,
          }
          build_uri('match', auth_key, nil, common_url_options(lang).merge(specific_options))
        end

        def parse response_body
          self.class.parse response_body
        end

        def self.parse response_body
          Statium::Opta::Model::Match.build response_body
        end
      end
    end
  end
end
