module Rack
  module EncodingGuard
    class RejectStrategy < Strategy
      def process
        return bad_request_response unless valid_request?
        yield
      end

      private

      def valid_request?
        Strategy::PROCESSIBLE_KEYS.all? do |key|
          value = env[key].to_s
          URI.decode(value).force_encoding(Encoding::UTF_8).valid_encoding?
        end
      end

      def bad_request_response
        [400, {}, ['Bad Request']]
      end
    end
  end
end
