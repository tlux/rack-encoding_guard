module Rack
  module EncodingGuard
    class RejectStrategy < Strategy
      DEFAULT_MESSAGE = 'Bad Request'

      def process(env)
        return bad_request_response if invalid_request?(env)
        yield
      end

      private

      def message
        options.fetch(:with, DEFAULT_MESSAGE)
      end

      def invalid_request?(env)
        Strategy::PROCESSIBLE_KEYS.any? do |key|
          !env[key].to_s.valid_encoding?
        end
      end

      def bad_request_response
        [400, {}, [message]]
      end
    end
  end
end
