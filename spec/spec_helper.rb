$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "statium/opta"
require 'open-uri'

ACTIVE_PREMIER_LEAGUE_TOURNAMENT_CALENDAR_UUID = "1pnncrpxn8wm3s9opk8n9ozxl"
ACTIVE_WATFORD_MAN_CITY_MATCH_ID = "96lguj4aux9abkzabccjdojmy"

def my_public_ip
  open('http://whatismyip.akamai.com').read
end

def public_ip_authorized?
  raise '[WARNING] Configuration issue. Rspec can not run as the IP in the environment is not authorized. Please set STATIUM_OPTA_AUTHORIZED_IP to an authorized public IP address.' unless my_public_ip == ENV['STATIUM_OPTA_AUTHORIZED_IP']
end

public_ip_authorized?
