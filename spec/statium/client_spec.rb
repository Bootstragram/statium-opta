require "spec_helper"

describe Statium::Opta::Client do
  it "requests Tournament Calendar OK" do
    client = Statium::Opta::Client.new
    tournament_calendar = Statium::Opta::Resource::TournamentCalendar.new
    completion = Proc.new do |success, data|
      puts "Success: #{success}"
      puts "Last updated: #{data['lastUpdated']}"
      data['competition'].each do |competition|
        puts "* Competition: #{competition['name']}"
        competition['tournamentCalendar'].each do |calendar|
          puts "    * Calendar: #{calendar['name']} - #{calendar['id']}/#{calendar['ocId']}"
        end
      end
    end
    client.load(tournament_calendar, completion)
  end

  it "requests Matches OK" do
    client = Statium::Opta::Client.new
    tournament_calendar = Statium::Opta::Resource::Match.new('6rvyyqeqqeny81bn7i8to5n8p')
    completion = Proc.new do |success, data|
      puts "Success: #{success}"
      data['match'].each do |match|
        puts "Match: #{match['matchInfo']['description']} (#{match['matchInfo']['date']})"
      end
    end
    client.load(tournament_calendar, completion)
  end
end
