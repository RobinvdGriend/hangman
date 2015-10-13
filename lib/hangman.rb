require_relative "hangman/game"
require_relative "hangman/ai"

module Hangman
  def self.run
    game = Game.load

    if game.word.nil?
      begin
        game.set_word(AI.generate_from_dictionary)
      rescue
        retry
      end
    end
    
  end
end
