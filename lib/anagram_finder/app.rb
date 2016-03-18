require 'anagram_finder'
require 'json'
require 'rack'

module AnagramFinder
  class App
    def self.call(env)
      request  = Rack::Request.new(env)
      response = Rack::Response.new
      response['Content-Type'] = 'application/json'

      query = request.path_info.split('/').last.to_s
      response.write(matches(query.split(',')).to_json) if query.length > 0

      response.finish
    end

    def self.matches(words)
      Hash[words.map do |word|
        [word, AnagramFinder.dictionary_matches_for_word(word)]
      end]
    end
  end
end
