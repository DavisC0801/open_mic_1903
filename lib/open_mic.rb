require "./lib/joke.rb"
require "./lib/user.rb"

class OpenMic

  attr_reader :location, :date, :performers

  def initialize(venue)
    #venue is a hash, assigning these based on the keys in the hash.
    @location = venue[:location]
    @date = venue[:date]
    @performers = []
  end

  def welcome(patron)
    @performers << patron
  end

  def repeated_jokes?
    #this iterates through the array and returns true if any
    #perfomers have a true repeated attribute.
    @performers.any? {|perfomer| perfomer.repeated}
  end

end
