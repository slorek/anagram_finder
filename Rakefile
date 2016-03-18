require 'bundler/setup'
$LOAD_PATH.unshift Bundler.root unless $LOAD_PATH.include?(Bundler.root)

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task :default => :spec
rescue LoadError
  # no rspec available
end

task :environment do
  require 'config/environment'
end

namespace :dictionary do
  task load: :environment do
    require 'anagram_finder/loader'

    puts 'Loading dictionary...'

    AnagramFinder::Loader.call

    puts 'Done!'
  end
end
