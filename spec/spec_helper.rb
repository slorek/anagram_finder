ENV['RACK_ENV'] = 'test'
require_relative '../config/environment'
require 'redis'

def fixture_path
  File.expand_path(File.join('..', 'support', 'fixtures'), __FILE__)
end

RSpec.configure do |config|
  redis = Redis.new(url: ENV['REDIS_URL'])

  config.before(:all) do
    redis.flushall
  end

  config.after(:all) do
    redis.flushall
  end
end
