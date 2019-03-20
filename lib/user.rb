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
    @repeated = @jokes.include?(joke)
    user.learn(joke)
  end

  def joke_by_id(idnum)
    @jokes.find{|joke| joke.id == idnum}
  end
end
