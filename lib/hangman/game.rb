require 'yaml'

module Hangman
  class Game
    attr_reader :word

    SAVE_PATH = "save.txt"

    def self.load
      if File.exist?("save.txt")
        return YAML.load(File.read("save.txt"))
      else
        game = Game.new
        File.open("save.txt", "w") do |f|
          f.puts YAML.dump(game)
        end
        game
      end
    end

    def initialize
      @word = nil
      @guesses = []
      @tries = 0
    end

    def set_word(word)
      if (5..12).include?(word.length)
        @word = word
      else
        raise "Invalid word length. Must be between 5 and 12 characters long"
      end
    end
  end
end
