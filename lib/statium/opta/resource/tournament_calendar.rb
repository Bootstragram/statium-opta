module Statium
  module Opta
    module Resource
      class TournamentCalendar < CommonResource
        def uri(auth_key, lang = 'en')
          build_uri('tournamentcalendar', auth_key, '/authorized', common_url_options(lang))
        end

        def parse response_body
          Statium::Opta::Model::Competition.build response_body
        end
      end
    end
  end
end
