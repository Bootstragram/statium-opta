module Statium
  module Opta
    module Resource
      autoload :CommonResource, 'statium/opta/resource/common'
      autoload :Venue, 'statium/opta/resource/venue'
      autoload :TournamentCalendar, 'statium/opta/resource/tournament_calendar'
      autoload :Match, 'statium/opta/resource/match'
      autoload :LiveMatch, 'statium/opta/resource/live_match'
    end

    class Client
      def load(auth_key, lang = 'en', resource, &completion)
        request_uri = resource.uri(auth_key, lang)
        res = Net::HTTP.get_response(request_uri)

        # Uncomment to debug
        # puts res.code
        # puts res.message
        # puts res.body

        if res.is_a?(Net::HTTPSuccess)
          yield(true, parse_JSON(resource, res.body))
        else
          yield(false, res.message)
        end
      end

      def load_from_file(filename, resource, &completion)
        yield(true, parse_JSON(resource, File.read(filename)))
      end

      private

      def parse_JSON resource, body
        resource.parse(JSON.parse(body))
      end
    end
  end
end
