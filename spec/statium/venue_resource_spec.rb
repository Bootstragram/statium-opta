require "spec_helper"
require 'open-uri'

def my_public_ip
  open('http://whatismyip.akamai.com').read
end

describe Statium::Opta::Client do
  if my_public_ip == ENV['STATIUM_OPTA_AUTHORIZED_IP']
    # Fetch a venue in english
    it "can fetch a venue resource in english" do
      venue_resource = Statium::Opta::Resource::Venue.new('6qv56cq8m56uq104fa4geubf9')
      Statium::Opta::Client.new.load(ENV['STATIUM_OPTA_OUTLET_AUTH_KEY'], 'en', venue_resource) do |success, venue|
        expect(success).to be true
        expect(venue.city).to eq 'Solna'
        expect(venue.contestants.count).to eq 2
        expect(venue.contestants[0].clubName). to eq 'AIK'
      end
    end

    # Fetch a venue in french
    it "can fetch a venue resource in french" do
      venue_resource = Statium::Opta::Resource::Venue.new('6qv56cq8m56uq104fa4geubf9')
      Statium::Opta::Client.new.load(ENV['STATIUM_OPTA_OUTLET_AUTH_KEY'], 'fr', venue_resource) do |success, venue|
        expect(success).to be true
        expect(venue.city).to eq 'Solna'
        expect(venue.contestants.count).to eq 2
        expect(venue.contestants[0].clubName). to eq 'AIK'
      end
    end
  else
    puts '[WARNING] Skipping network tests as the IP in the environment is not authorized'
  end
end
