# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: rack-encoding_guard 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-encoding_guard"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tobias Casper"]
  s.date = "2015-06-27"
  s.description = "A middleware to process wrong encoded URLs in Rack applications."
  s.email = "tobias.casper@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/rack-encoding_guard.rb",
    "lib/rack/encoding_guard.rb",
    "lib/rack/encoding_guard/middleware.rb",
    "lib/rack/encoding_guard/reject_strategy.rb",
    "lib/rack/encoding_guard/sanitize_strategy.rb",
    "lib/rack/encoding_guard/strategy.rb",
    "rack-encoding_guard.gemspec",
    "spec/lib/rack/encoding_guard/middleware_spec.rb",
    "spec/lib/rack/encoding_guard/reject_strategy_spec.rb",
    "spec/lib/rack/encoding_guard/sanitize_strategy_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/.keep",
    "spec/support/mock_app.rb",
    "spec/support/shared_examples_for_strategy.rb"
  ]
  s.homepage = "http://github.com/tlux/rack-encoding_guard"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "A middleware to process wrong encoded URLs in Rack applications."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, [">= 0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<rubocop>, [">= 0"])
      s.add_dependency(%q<codeclimate-test-reporter>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<rubocop>, [">= 0"])
    s.add_dependency(%q<codeclimate-test-reporter>, [">= 0"])
  end
end

