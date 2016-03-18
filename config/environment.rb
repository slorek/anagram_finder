ENV['RACK_ENV'] ||= 'development'

if ['development','test'].include? ENV['RACK_ENV']
  require 'pry'
  require 'dotenv'
  Dotenv.load ".env.#{ENV['RACK_ENV']}"
end
