module Rack
  module EncodingGuard
    class Middleware
      attr_reader :app, :strategy, :options

      def initialize(app, strategy = nil, options = {})
        @app = app
        @strategy = resolve_strategy_class(strategy)
        @options = options
      end

      def call(env)
        strategy.new(env, options).process do
          app.call(env)
        end
      end

      private

      def resolve_strategy_class(strategy)
        case strategy
        when nil then RejectStrategy
        when Class then strategy
        when String then strategy.constantize
        when Symbol
          class_name = "#{strategy.to_s.camelize}Strategy"
          EncodingGuard.const_get(class_name)
        else
          fail ArgumentError, "Invalid strategy: #{strategy.inspect}"
        end
      end
    end
  end
end
