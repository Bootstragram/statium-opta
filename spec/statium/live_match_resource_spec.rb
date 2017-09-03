require "spec_helper"

describe Statium::Opta::Client do
  # Fetch live games
  it "can fetch live games status" do
    match_resource = Statium::Opta::Resource::LiveMatch.new('1pnncrpxn8wm3s9opk8n9ozxl')
    Statium::Opta::Client.new.load(ENV['STATIUM_OPTA_OUTLET_AUTH_KEY'], 'en', match_resource) do |success, matches|
      expect(success).to be true
      # We depend on time here so there's not much more we can do...
    end
  end

  it "can parse stored resources from a specific games (minute 15)" do
    match_resource = Statium::Opta::Resource::LiveMatch.new('2c1fh40r28amu4rgz0q66ago9')
    Statium::Opta::Client.new.load_from_file('resources/live-15-0-0-sample.json', match_resource) do |success, matches|
      expect(success).to be true
      expect(matches.count).to eq 1

      this_match = matches[0]
      expect(this_match.matchInfo.description).to eq 'Ajax vs Manchester United'
      expect(this_match.liveData.matchDetails.matchTime).to eq 16
      expect(this_match.liveData.matchDetails.scores.ft.home).to eq 0
      expect(this_match.liveData.matchDetails.scores.ft.away).to eq 0
    end
  end

  it "can parse stored resources from a specific games (minute 16)" do
    match_resource = Statium::Opta::Resource::LiveMatch.new('2c1fh40r28amu4rgz0q66ago9')
    Statium::Opta::Client.new.load_from_file('resources/live-16-0-0-sample.json', match_resource) do |success, matches|
      this_match = matches[0]
      expect(this_match.liveData.matchDetails.matchTime).to eq 16
      expect(this_match.liveData.matchDetails.scores.ft.home).to eq 0
      expect(this_match.liveData.matchDetails.scores.ft.away).to eq 1
    end
  end

  it "can parse stored resources from a specific games (minute 60)" do
    match_resource = Statium::Opta::Resource::LiveMatch.new('2c1fh40r28amu4rgz0q66ago9')
    Statium::Opta::Client.new.load_from_file('resources/live-60-0-2-sample.json', match_resource) do |success, matches|
      this_match = matches[0]
      expect(this_match.liveData.matchDetails.matchTime).to eq 60
      expect(this_match.liveData.matchDetails.scores.ft.home).to eq 0
      expect(this_match.liveData.matchDetails.scores.ft.away).to eq 2
    end
  end
end
