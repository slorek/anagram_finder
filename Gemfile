source "http://rubygems.org"

ruby '2.3.0'

lib_path = File.expand_path(File.join('..', 'lib'), __FILE__)
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

gem 'puma'
gem 'rack'
gem 'rake'
gem 'redis'

group :development, :test do
  gem 'dotenv'
  gem 'pry'
end

group :test do
  gem 'rspec'
end
