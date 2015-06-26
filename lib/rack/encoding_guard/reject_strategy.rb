module Rack
  module EncodingGuard
    class RejectStrategy < Strategy
      DEFAULT_RESPONSE = 'Bad Request'

      def process
        return bad_request_response unless valid_request?
        yield
      end

      private

      def message
        options.fetch(:with, DEFAULT_RESPONSE) 
      end

      def valid_request?
        Strategy::PROCESSIBLE_KEYS.all? do |key|
          value = env[key].to_s
          URI.decode(value).force_encoding(Encoding::UTF_8).valid_encoding?
        end
      end

      def bad_request_response
        [400, {}, [message]]
      end
    end
  end
end
