require 'anagram_finder'

module AnagramFinder
  class Loader
    def self.call(*args)
      new(*args).call
    end

    def initialize(file: default_file)
      @file = file
    end

    def call
      load_dictionary
    end

    private

    attr_reader :file

    def default_file
      File.expand_path(File.join('..', '..', '..', 'dictionary.txt'), __FILE__)
    end

    def load_dictionary
      IO.foreach(file) { |word| AnagramFinder.add_word_to_dictionary(word) }
    end
  end
end
