gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_multiple_letters

    assert_equal 5, Scrabble.new.score("af")
    assert_equal 9, Scrabble.new.score("forest")
  end

  def test_it_raises_typeerror_if_given_integer_or_number_string

    assert_equal "Invalid Response", Scrabble.new.score('1')
    assert_equal "Invalid Response", Scrabble.new.score(2)
  end

  def test_it_returns_zero_if_nil
    assert_equal 0, Scrabble.new.score('')
  end

  def test_it_recieves_added_values
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_takes_additional_multipliers
    assert_equal 18, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_adds_10_to_words_over_7_chars
    assert_equal 58, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
end
