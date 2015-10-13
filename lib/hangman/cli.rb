module Hangman
  module CLI
    TRUE_ANSWERS = ["yes", "ye", "y"]
    FALSE_ANSWERS = ["no", "nope", "n"]

    SAVE_COMMANDS = ["save"]
    QUIT_COMMANDS = ["quit", "q", "exit"]

    def self.load_game?
      print "Would you like to continue from a previous saved game? (Y/N)"

      loop do
        answer = gets.chomp.downcase
        puts

        if TRUE_ANSWERS.include?(answer)
          return true
        elsif FALSE_ANSWERS.include?(answer)
          return false
        else
          print "Invalid input: please enter 'Y' or 'N':"
        end
      end
    end

    def self.take_guess
      print "Enter your guess or enter SAVE to save the game or QUIT to quit:"

      loop do
        input = gets.chomp.downcase
        puts

        if SAVE_COMMANDS.include?(input)
          return :save
        elsif QUIT_COMMANDS.include?(input)
          return :quit
        elsif input.size == 1
          return input
        else
          print "Invalid input: please enter a guess of only 1 character or use SAVE or QUIT:"
        end
      end
    end
  end
end
