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
        end
      end
    end

  end
end
