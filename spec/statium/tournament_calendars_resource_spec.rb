require "spec_helper"
require 'open-uri'

def my_public_ip
  open('http://whatismyip.akamai.com').read
end

describe Statium::Opta::Client do
  if my_public_ip == ENV['STATIUM_OPTA_AUTHORIZED_IP']

    # Fetch all authorized tournament Calendars
    it "can fetch authorized tournament calendars" do
      tournament_calendar_resource = Statium::Opta::Resource::TournamentCalendar.new
      Statium::Opta::Client.new.load(ENV['STATIUM_OPTA_OUTLET_AUTH_KEY'], 'en', tournament_calendar_resource) do |success, calendars|
        expect(success).to be true
        expect(calendars.count).to be > 0
        expect(calendars[0].name).to eq 'Premier League'
        expect(calendars[0].tournamentCalendars.count).to be > 0

        premier_league_2016_2017 = calendars[0].tournamentCalendars.select { |calendar| calendar.id == '2c1fh40r28amu4rgz0q66ago9' }
        expect(premier_league_2016_2017).not_to be nil
        expect(premier_league_2016_2017.count).to be 1
        expect(premier_league_2016_2017[0].name).to eq '2016/2017'
      end
    end
  else
    puts '[WARNING] Skipping network tests as the IP in the environment is not authorized'
  end
end
