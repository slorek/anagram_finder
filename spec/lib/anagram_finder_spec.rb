require 'spec_helper'
require 'anagram_finder'

RSpec.describe AnagramFinder do
  let(:redis) { Redis.new(url: ENV['REDIS_URL']) }
  before { allow(described_class).to receive(:redis).and_return(redis) }

  describe '.add_word_to_dictionary' do
    let(:word) { 'test ' }

    it 'adds the word to the database against the correct anagram index and strips whitespace' do
      expect(redis).to receive(:sadd).with('estt', 'test')
      described_class.add_word_to_dictionary(word)
    end
  end

  describe '.dictionary_matches_for_word' do
    before do
      described_class.add_word_to_dictionary('cuprites')
      described_class.add_word_to_dictionary('pictures')
    end

    it 'returns anagram matches for the word' do
      expect(described_class.dictionary_matches_for_word('piecrust')).to eq(['pictures','cuprites'])
    end

    it 'does not return the word searched for' do
      expect(described_class.dictionary_matches_for_word('piecrust')).not_to include('piecrust')
    end
  end
end
