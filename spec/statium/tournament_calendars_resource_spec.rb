require "spec_helper"

describe Statium::Opta::Client do
  # Fetch all authorized tournament Calendars
  it "can fetch authorized tournament calendars" do
    tournament_calendar_resource = Statium::Opta::Resource::TournamentCalendar.new
    Statium::Opta::Client.new.load(ENV['STATIUM_OPTA_OUTLET_AUTH_KEY'], 'en', tournament_calendar_resource) do |success, calendars|
      expect(success).to be true
      expect(calendars.count).to be > 0

      # Extrat the Premier League (id 2kwbbcootiqqgmrzs6o5inle5)
      premier_league_candidates = calendars.select { |calendar| calendar.id == '2kwbbcootiqqgmrzs6o5inle5' }
      expect(premier_league_candidates.count).to eq 1
      premier_league = premier_league_candidates[0]
      expect(premier_league.name).to eq 'Premier League'
      expect(premier_league.tournamentCalendars.count).to be > 0

      # Extract the 2017/2018 season of the Premier League (id 1pnncrpxn8wm3s9opk8n9ozxl)
      premier_league_2017_2018_candidates = premier_league.tournamentCalendars.select { |tournament_calendar| tournament_calendar.id == '1pnncrpxn8wm3s9opk8n9ozxl' }
      expect(premier_league_2017_2018_candidates).not_to be nil
      expect(premier_league_2017_2018_candidates.count).to be 1
      expect(premier_league_2017_2018_candidates[0].name).to eq '2017/2018'
    end
  end
end
