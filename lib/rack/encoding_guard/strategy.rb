module Rack
  module EncodingGuard
    class Strategy
      PROCESSIBLE_KEYS = %w(
        HTTP_REFERER
        PATH_INFO
        REQUEST_URI
        REQUEST_PATH
        QUERY_STRING
      )

      def self.process(env)
        new(env).process
      end

      attr_reader :env

      def initialize(env)
        @env = env
      end

      def process
        yield
      end
    end
  end
end

require 'rack/encoding_guard/reject_strategy'
require 'rack/encoding_guard/sanitize_strategy'
