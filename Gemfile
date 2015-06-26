source 'http://rubygems.org'

gem 'rack'
gem 'activesupport', '>= 3.0.0'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.

group :development do
  gem 'rspec'
  if RUBY_VERSION.split('.').first == '1'
    gem 'pry-debugger'
  else
    gem 'pry-byebug'
  end
  gem 'bundler', '~> 1.0'
  gem 'jeweler', '~> 2.0.1'
  gem 'yard'
  gem 'rubocop', require: false
  gem 'codeclimate-test-reporter', require: nil
end
