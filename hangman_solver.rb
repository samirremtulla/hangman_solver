#hangman_solver
class Hangman_Solver

attr_accessor :word, :word_list, :curated, :length, :letter, :position

  def initialize()
    file = File.open("/usr/share/dict/words")
    @word_list = file.read.split
    @curated = []
  end

  def chars(length)
    @word = Array.new(length.to_i)
    @length = length.to_i
    curated_list
  end

  def newletter(position, letter)
    @word[position-1] = letter
  end

  def curated_list
    @word_list.each do |x|
      if @length == x.length
        @curated << x.split("")
      end
    end
    @curated
  end

  def match_list(position, letter)
    matches = Array.new
    for word in 0..(@curated.length-1)
      if @curated[word][position-1] == letter
        matches << @curated[word]
      end
    end 
    @curated = matches
  end

end

#curated has the list of words you need!


    # game = Hangman_Solver.new
    # game.chars(5)
    # game.newletter(1,"s")
    # game.match_list(1,"s")
    # p game.curated
    # game.newletter(5,"r")
    # game.match_list(5,"r")
    # p game.curated

