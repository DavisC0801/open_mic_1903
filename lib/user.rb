require "./lib/joke.rb"

class User

  attr_reader :name, :jokes, :repeated

  def initialize(name)
    @name = name
    @jokes = []
    @repeated = false
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    #repeated defaults to false and will change to true if they tell
    #a joke they have previously learned.
    @repeated = @jokes.include?(joke)
    user.learn(joke)
  end

  def joke_by_id(idnum)
    #this iterates through the jokes array and returns a joke object if
    #it can find a matching ID number.
    @jokes.find{|joke| joke.id == idnum}
  end
end
