ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'bundler/setup'
require 'rack'
require 'rack/encoding_guard'
require 'rspec'
require 'pry-byebug'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
