module Hangman
  module CLI
    TRUE_ANSWERS = ["yes", "ye", "y"]
    FALSE_ANSWERS = ["no", "nope", "n"]

    def self.load_game?
      print "Would you like to continue from a previous saved game? (Y/N)"

      loop do
        answer = gets.chomp.downcase

        if TRUE_ANSWERS.include?(answer)
          return true
        elsif FALSE_ANSWERS.include?(answer)
          return false
        else
          print "Invalid input: please enter 'Y' or 'N':"
        end
      end

    end
  end
end
