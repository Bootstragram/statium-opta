require "spec_helper"
require 'open-uri'

def my_public_ip
  open('http://whatismyip.akamai.com').read
end

describe Statium::Opta::Client do
  if my_public_ip == ENV['STATIUM_OPTA_AUTHORIZED_IP']

    # Fetch all authorized tournament Calendars
    it "can fetch the games of a competition" do
      match_resource = Statium::Opta::Resource::Match.new('2c1fh40r28amu4rgz0q66ago9')
      Statium::Opta::Client.new.load(ENV['STATIUM_OPTA_OUTLET_AUTH_KEY'], 'en', match_resource) do |success, matches|
        expect(success).to be true
        expect(matches.count).to eq 380

        this_match = matches.select do |match|
          match.matchInfo.id == 'a8dt4x24v9axu9newje2pgxyh'
        end
        expect(this_match.count).to eq 1

        watford_vs_manchester_city = this_match[0]
        expect(watford_vs_manchester_city.matchInfo.description).to eq 'Watford vs Manchester City'
      end
    end
  else
    puts '[WARNING] Skipping network tests as the IP in the environment is not authorized'
  end
end
