require_relative "hangman/game"
require_relative "hangman/ai"
require_relative "hangman/cli"

module Hangman
  def self.run
    game = CLI.load_game? ? Game.load : Game.new

    if game.word.nil?
      begin
        game.set_word(AI.generate_from_dictionary)
      rescue
        retry
      end
    end

    until game.won? || game.lost?
      CLI.print_correct_letters(word: game.word, letters: game.correct_guesses)
      CLI.print_incorrect_letters(letters: game.incorrect_guesses)
      CLI.print_tries_left(tries_left: game.tries_left)

      input = CLI.take_guess

      if input == :save
        game.save
      elsif input == :quit
        exit
      else
        begin
          game.enter_guess(input)
        rescue => e
          puts e.message
          puts
        end
      end

      if game.won?
        CLI.print_won
      elsif game.lost?
        CLI.print_lost
      end
    end
    Game.clean_save
    self.run if CLI.play_again?
  end
end
