module Statium
  module Opta
    module Resource
      class Match < CommonResource
        attr_accessor :tournament_calendar_uuid
        attr_accessor :page_number
        attr_accessor :page_size

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
            _pgSz: @page_size,
          }
          build_uri('match', auth_key, nil, common_url_options(lang).merge(specific_options))
        end

        def parse response_body
          Statium::Opta::Model::Match.build response_body
        end
      end
    end
  end
end
