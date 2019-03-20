require "./lib/joke.rb"
require "./lib/user.rb"

class OpenMic

attr_reader :location, :date, :performers

def initialize(venue)
  @location = venue[:location]
  @date = venue[:date]
  @performers = []
end

def welcome(patron)
  @performers << patron
end

end
