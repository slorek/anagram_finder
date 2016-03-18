require 'spec_helper'
require 'json'
require 'anagram_finder/app'
require 'anagram_finder/loader'

RSpec.describe AnagramFinder::App do
  let(:dictionary_file) { File.join(fixture_path, 'dictionary.txt') }
  let(:expected_response) do
    {
      'crepitus' => ['pictures','piecrust','cuprites'],
      'paste'    => ['peats','tepas','pates','septa','tapes','spate']
    }
  end

  before { AnagramFinder::Loader.call(file: dictionary_file) }

  describe '.call' do
    let(:words) { 'crepitus,paste' }
    let(:request) { Rack::MockRequest.new(described_class).get("/#{words}")  }

    it 'returns a JSON Content-Type header' do
      expect(request.content_type).to eq('application/json')
    end

    it 'returns a 200 response code' do
      expect(request.status).to eq(200)
    end

    it 'returns a JSON payload' do
      expect(JSON.parse(request.body)).to eq(expected_response)
    end
  end

  describe '.matches' do
    it 'returns a Hash of matches' do
      expect(described_class.matches(['crepitus','paste'])).to eq(expected_response)
    end
  end
end
