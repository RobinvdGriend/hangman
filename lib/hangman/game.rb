require 'yaml'

module Hangman
  class Game
    attr_reader :word
    attr_reader :guesses
    attr_reader :tries_left

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

    def save
      File.open("save.txt", "w") do |f|
        f.puts YAML.dump(self)
      end
    end

    def initialize
      @word = nil
      @guesses = []
      @tries_left = 10
    end

    def enter_guess(guess)
      raise "A guess must be 1 character long" unless guess.size == 1
      raise "This guess has already been entered" if guesses.include?(guess)

      guesses << guess
    end


    def set_word(word)
      if (5..12).include?(word.length)
        @word = word.to_s
      else
        raise "Invalid word length. Must be between 5 and 12 characters long"
      end
    end

    def won?
      correct_guesses.size == word.size
    end

    def lost?
      tries_left == 0
    end

    def correct_guesses
      word.each_char.select { |c| guesses.include?(c) }
    end

    def incorrect_guesses
      word.each_char.reject { |c| guesses.include?(c) }
    end
  end
end
