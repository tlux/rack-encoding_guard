module Rack
  module EncodingGuard
    class Middleware
      attr_reader :app, :strategy

      def initialize(app, strategy = nil)
        @app = app
        @strategy = resolve_strategy_class(strategy)
      end

      def call(env)
        strategy.process(env) do
          app.call(env)
        end
      end

      private

      def resolve_strategy_class(strategy)
        case strategy
        when nil then RejectStrategy
        when Class then strategy
        when Symbol
          EncodingGuard.const_get("#{strategy.to_s.camelize}Strategy")
        else fail ArgumentError, "Unknown strategy: #{strategy.inspect}"
        end
      end
    end
  end
end
