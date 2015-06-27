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

      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def process(env)
        yield
      end
    end
  end
end

require 'rack/encoding_guard/reject_strategy'
require 'rack/encoding_guard/sanitize_strategy'
