module Rack
  module EncodingGuard
    class Strategy
      def self.resolve(strategy)
        case strategy
        when nil then RejectStrategy
        when Symbol
          EncodingGuard.const_get("#{strategy.to_s.camelize}Strategy")
        else strategy.to_s.constantize
        end
      end

      attr_reader :app

      def initialize(app)
        @app = app
      end

      def call(env)
        fail NotImplementedError,
             'Override #call in your strategy implementation'
      end
    end
  end
end

require 'rack/encoding_guard/reject_strategy'
require 'rack/encoding_guard/sanitize_strategy'
