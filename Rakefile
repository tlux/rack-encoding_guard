# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = 'rack-encoding_guard'
  gem.homepage = 'http://github.com/tlux/rack-encoding_guard'
  gem.license = 'MIT'
  gem.summary = %Q{A middleware to process wrong encoded URLs in Rack applications.}
  gem.description = gem.summary
  gem.email = 'tobias.casper@gmail.com'
  gem.authors = ['Tobias Casper']
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'yard'
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  t.stats_options = ['--list-undoc']
end