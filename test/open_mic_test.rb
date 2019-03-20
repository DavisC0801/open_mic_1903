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

  def test_it_has_a_location
    assert_equal "Comedy Works", @open_mic.location
  end

  def test_it_has_a_date
    assert_equal "11-20-18", @open_mic.date
  end

  def test_it_starts_with_no_performers
    assert_equal [], @open_mic.performers
  end

  def test_it_can_add_performers
    assert_equal [], @open_mic.performers

    @open_mic.welcome(@sal)
    assert_equal [@sal], @open_mic.performers

    @open_mic.welcome(@ali)
    assert_equal [@sal, @ali], @open_mic.performers
  end

  def test_if_jokes_are_repeated
    @ali.learn(@joke1)
    @ali.learn(@joke2)
    refute @open_mic.repeated_jokes?

    @ali.tell(@sal, @joke1)
    assert @open_mic.repeated_jokes?
  end
end
