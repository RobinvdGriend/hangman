require 'yaml'

module Hangman
  class Game
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
      @word = ""
      @guesses = []
      @tries = 0
    end
  end
end
