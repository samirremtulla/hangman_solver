#Hangman Solver Tests

require "test/unit"
require_relative "hangman_solver"

class HangmanTest < Test::Unit::TestCase

  def test_correct_word_length
    game = Hangman_Solver.new
    game.chars(5)
    assert_equal 5, game.word.length
  end

  def test_position_of_a_new_letter
    game = Hangman_Solver.new
    game.chars(6)
    game.newletter(1,"r")
    assert_equal ["r", nil, nil, nil, nil, nil] , game.word
  end

  def test_position_of_a_second_letter
    game = Hangman_Solver.new
    game.chars(6)
    game.newletter(1,"r")
    game.newletter(2,"s")
    assert_equal ["r", "s", nil, nil, nil, nil] , game.word
  end

  
  def test_guesses_correct_number_of_possible_words
    game = Hangman_Solver.new
    game.chars(5)
    game.newletter(1,"s")
    game.match_list(1,"s")
    game.newletter(5,"r")
    game.match_list(5,"r")
    assert_equal 1 , game.curated.length
  end

end




  # def test_number_of_characters_in_list
  #   game = Hangman_Solver.new
  #   game.chars(5)
  #   game.curated_list
  #   assert_equal 4, game.curated.length
  # end