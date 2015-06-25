module Rack
  module EncodingGuard
    class SanitizeStrategy < Strategy
      def process
        Strategy::PROCESSIBLE_KEYS.each do |key|
          env[key] = env[key].to_s.encode(Encoding::UTF_8, Encoding::BINARY,
                                          invalid: :replace, undef: :replace,
                                          replace: '')
        end
        yield
      end
    end
  end
end
