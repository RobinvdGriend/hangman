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

  end
end
