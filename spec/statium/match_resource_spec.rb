require "spec_helper"

describe Statium::Opta::Client do
  # Fetch games of a competition
  it "can fetch the games of a competition" do
    match_resource = Statium::Opta::Resource::Match.new(ACTIVE_PREMIER_LEAGUE_TOURNAMENT_CALENDAR_UUID)
    Statium::Opta::Client.new.load(ENV['STATIUM_OPTA_OUTLET_AUTH_KEY'], 'en', match_resource) do |success, matches|
      expect(success).to be true
      expect(matches.count).to eq 380

      this_match = matches.select do |match|
        match.matchInfo.id == ACTIVE_WATFORD_MAN_CITY_MATCH_ID
      end
      expect(this_match.count).to eq 1

      watford_vs_manchester_city = this_match[0]
      expect(watford_vs_manchester_city.matchInfo.description).to eq 'Watford vs Manchester City'
    end
  end
end
