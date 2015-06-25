module Rack
  module EncodingGuard
    attr_reader :strategy

    def initialize(app, options = {})
      @app = app
      @strategy = Strategy.resolve(options[:strategy]).new(app)
    end

    def call(env)
      strategy.call(env)
    end
  end
end

require 'rack/encoding_guard/strategy'
