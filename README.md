# Rack::EncodingGuard

[![Code Climate](https://codeclimate.com/github/tlux/rack-encoding_guard/badges/gpa.svg)](https://codeclimate.com/github/tlux/rack-encoding_guard) [![Test Coverage](https://codeclimate.com/github/tlux/rack-encoding_guard/badges/coverage.svg)](https://codeclimate.com/github/tlux/rack-encoding_guard/coverage) [![Build Status](https://travis-ci.org/tlux/rack-encoding_guard.svg?branch=master)](https://travis-ci.org/tlux/rack-encoding_guard)

A middleware to process wrong encoded URLs in Rack applications.

## Requirements
This software has been tested in following environments:
* Ruby 1.9.3
* Ruby 2.0
* Ruby 2.1
* Ruby 2.2
* JRuby
* Rubinius 2

## Setup
`gem install rack-encoding_guard`

If you are using Bundler add the following line to your Gemfile:
```ruby
gem 'rack-encoding_guard', '~> 0.1'
```

## Usage
If you are on Rails, you can insert the middleware into your application.rb
```ruby
config.middleware.use 'Rack::EncodingGuard::Middleware'
```

### Sanitize Strategy
This is the default strategy. When using sanitization strategy, all invalid
characters will be stripped out of all relevant ENV vars. Subsequently, no
encoding errors will occur down the middleware stack.
```ruby
config.middleware.use 'Rack::EncodingGuard::Middleware', :sanitize
```

### Reject Strategy
When using reject strategy, all requests containing invalid characters are
rejected with a HTTP 400 status ("Bad Request"). Additionally, you can
override which message will be displayed to the requesting user:
```ruby
config.middleware.use 'Rack::EncodingGuard::Middleware', :reject, with: 'Check that URL, mate!'
```

## Contributing to Rack::EncodingGuard
* Check out the latest master to make sure the feature hasn't been implemented
  or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it
  and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to
  have your own version, or is otherwise necessary, that is fine, but please
  isolate to its own commit so I can cherry-pick around it.

## Copyright
Copyright (c) 2015 Tobias Casper. See LICENSE.txt for further details.

