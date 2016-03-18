require 'spec_helper'
require 'string'

RSpec.describe String do

  subject { 'Test-string ' }

  describe '#anagram_index' do
    it 'returns the string characters sorted' do
      expect(subject.anagram_index).to eq('-eginrssttt')
    end
  end
end
