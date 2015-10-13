module Hangman
  module AI
    DICTIONARY_PATH = "lib/hangman/ai/dictionary.txt"

    def self.generate_from_dictionary
      line_count = %x{wc -l #{DICTIONARY_PATH}}.split.first.to_i
      random_line = rand(line_count)
      File.open(DICTIONARY_PATH) do |f|
        (random_line - 1).times { f.gets }
        f.gets.strip
      end
    end

  end
end
