require "minitest/autorun"
require "minitest/pride"
require "./lib/joke.rb"
require "./lib/user.rb"

class UserTest < Minitest::Test

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_it_exists
    assert_instance_of User, @sal
  end

  def test_user_has_a_name_from_argument
    assert_equal "Sal", @sal.name
  end

  def test_user_starts_with_no_jokes_known
    assert_equal [], @sal.jokes
  end

  def test_user_can_learn_jokes
    assert_equal [], @sal.jokes

    @sal.learn(@joke1)
    assert_equal [@joke1], @sal.jokes

    @sal.learn(@joke2)
    assert_equal [@joke1, @joke2], @sal.jokes
  end

  def test_user_can_tell_jokes
    @sal.tell(@ali, @joke1)
    assert_equal [@joke1], @ali.jokes

    @sal.tell(@ali, @joke2)
    assert_equal [@joke1, @joke2], @ali.jokes
  end

  def test_jokes_can_be_found_by_id
    @sal.tell(@ali, @joke1)
    @sal.tell(@ali, @joke2)

    assert_equal @joke1, @ali.joke_by_id(1)
    assert_equal @joke2, @ali.joke_by_id(2)
  end
end
