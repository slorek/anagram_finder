require 'anagram_finder/app'

use Rack::CommonLogger, STDOUT

run AnagramFinder::App
