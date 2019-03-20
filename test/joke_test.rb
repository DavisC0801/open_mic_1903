require "minitest/autorun"
require "minitest/pride"
require "./lib/joke.rb"

class JokeTest < Minitest::Test

  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  def test_it_exists
    assert_instance_of Joke, @joke
  end

  def test_joke_id_matches_what_was_passed
    assert_equal 1, @joke.id
  end

  def test_joke_setup_matches_argument
    assert_equal "Why did the strawberry cross the road?", @joke.setup
  end

  def test_joke_punchline_matches_argument
    assert_equal "Because his mother was in a jam.", @joke.punchline
  end
end
