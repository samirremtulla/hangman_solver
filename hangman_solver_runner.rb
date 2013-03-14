require_relative "hangman_solver"

# def solve?  
#   print "Still need to solve the game? (y/n) "
#   solve = gets.chomp.to_s
#   return solve? == "y"
# end

def play_game
  game = Hangman_Solver.new

  puts "Welcome to the Hangman Solver!"

  print "Please enter the number of characters in the word: "
  chars = gets.chomp
  game.chars(chars)

  while 0<1 
    print "Solved the puzzle??? (y/n) "
    solve = gets.chomp.to_s
    if solve == "y"
      system ("clear")
      puts "Thanks for using the Hangman Solver!!"
      break
    end
    system ("clear")
    puts "=============================================="
    puts "================Hangman Solver!==============="
    puts "=============================================="
    puts ""
    
    print "Did you correctly guess the letter? (y/n) "
    input = gets.chomp
    puts ""

    if input == "y"

      print "Please enter the correct letter you guessed: "
      letter = gets.chomp
      puts ""

      print "Please enter the correct position of the letter you guessed (starts at 1 ex. if the first letter was correct, put 1): "
      position = gets.chomp.to_i
      puts ""

      game.newletter(position, letter)
      game.match_list(position, letter)

      display = game.curated
      display = display.map {|a| a.join("")}
      puts "These are the possible words: "
      puts display
      puts "=============================================="

    else
      print "What letter did you guess? "
      letter = gets.chomp
      puts ""

      game.wrong_letter(letter)

      display = game.curated
      display = display.map {|a| a.join("")}
      puts "These are the possible words: "
      puts display
      puts "=============================================="
    end
  end
end

play_game
