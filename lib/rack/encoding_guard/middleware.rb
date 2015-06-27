module Rack
  module EncodingGuard
    class Middleware
      attr_reader :app, :strategy

      def initialize(app, strategy = nil, options = {})
        @app = app
        @strategy = resolve_strategy_object(strategy, options)
      end

      def call(env)
        strategy.process(env) do
          app.call(env)
        end
      end

      private

      def resolve_strategy_object(strategy, options)
        case strategy
        when nil then RejectStrategy.new(options)
        when Class then strategy.new(options)
        when String then strategy.constantize.new(options)
        when Symbol
          class_name = "#{strategy.to_s.camelize}Strategy"
          EncodingGuard.const_get(class_name).new(options)
        else
          unless strategy.respond_to?(:process)
            fail ArgumentError, "Invalid strategy: #{strategy.inspect}"
          end
          strategy
        end
      end
    end
  end
end
