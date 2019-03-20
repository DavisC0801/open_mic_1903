require "minitest/autorun"
require "minitest/pride"
require "./lib/joke.rb"
require "./lib/user.rb"
require "./lib/open_mic.rb"

class OpenMicTest < Minitest::Test

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
  end

  def test_it_exists
    assert_instance_of OpenMic, @open_mic
  end
end

# pry(main)> open_mic.location
# # => "Comedy Works"
#
# pry(main)> open_mic.date
# # => "11-20-18"
#
# pry(main)> open_mic.performers
# # => []
#
# pry(main)> sal = User.new("Sal")
# # => #<User:0x00007fe8fda12a00...>
#
# pry(main)> ali = User.new("Ali")
# # => #<User:0x00007fe8ff0dddc0...>
#
# pry(main)> open_mic.welcome(sal)
#
# pry(main)> open_mic.welcome(ali)
#
# pry(main)> open_mic.performers
# # => [#<User:0x00007fe8fda12a00...>, #<User:0x00007fe8ff0dddc0...>]
#
# pry(main)> joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
# # => #<Joke:0x00007fe8fd892978...>
#
# pry(main)> joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
# # => #<Joke:0x00007fe8fe19f250...>
#
# pry(main)> ali.learn(joke_1)
#
# pry(main)> ali.learn(joke_2)
#
# pry(main)> open_mic.repeated_jokes?
# # => false
#
# pry(main)> ali.tell(sal, joke_1)
#
# pry(main)> open_mic.repeated_jokes?
# # => true
