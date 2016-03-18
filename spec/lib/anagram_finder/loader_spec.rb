require 'spec_helper'
require 'anagram_finder/loader'

RSpec.describe AnagramFinder::Loader do
  describe '.call' do
    let(:file) { File.join(fixture_path, 'dictionary.txt') }

    it 'loads each word in the dictionary file' do
      expect(AnagramFinder).to receive(:add_word_to_dictionary).exactly(11).times
      described_class.call(file: file)
    end
  end
end
