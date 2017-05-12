require "statium/opta/version"
require "json"

module Statium
  module Opta
    module Resource
      class Match
        attr_accessor :tournament_calendar_uuid

        def initialize(tournament_calendar_uuid)
          @tournament_calendar_uuid = tournament_calendar_uuid
        end

        def request
          url_options = {
            _fmt: 'json',
            _lcl: 'en',
            tmcl: @tournament_calendar_uuid
          }

          uri = URI::HTTP.build(
          host: 'api.performfeeds.com',
          path: "/soccerdata/match/#{ENV['STATIUM_OPTA_OUTLET_AUTH_KEY']}"
          )

          uri.query = URI.encode_www_form(url_options)
          uri
        end

        def parse response_body
          JSON.parse(response_body)
        end
      end

      class TournamentCalendar
        def request
          url_options = {
            _fmt: 'json',
            _lcl: 'en'
          }

          uri = URI::HTTP.build(
          host: 'api.performfeeds.com',
          path: "/soccerdata/tournamentcalendar/#{ENV['STATIUM_OPTA_OUTLET_AUTH_KEY']}/authorized"
          )

          uri.query = URI.encode_www_form(url_options)
          uri
        end

        def parse response_body
          JSON.parse(response_body)
        end
      end
    end

    class Client
      def load(resource, completion)
        request_uri = resource.request
        res = Net::HTTP.get_response(request_uri)
        if res.is_a?(Net::HTTPSuccess)
          completion.call(true, resource.parse(res.body))
        else
          # puts res.code
          # puts res.message
          completion.call(false, res.message)
        end
      end
    end
  end
end
