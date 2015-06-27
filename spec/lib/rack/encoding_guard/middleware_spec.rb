require 'spec_helper'

describe Rack::EncodingGuard::Middleware do
  let(:app) { MockApp.new(200, {}, 'Default') }

  describe '.new' do
    it 'raises without arguments' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it 'requires an app as first argument' do
      expect { described_class.new(app) }.not_to raise_error
    end

    context 'with strategies' do
      it 'uses RejectStrategy when second argument is omitted' do
        middleware = described_class.new(app)
        expect(middleware.strategy).to be_a Rack::EncodingGuard::RejectStrategy
      end

      it 'uses RejectStrategy when second argument is nil' do
        middleware = described_class.new(app, nil)
        expect(middleware.strategy).to be_a Rack::EncodingGuard::RejectStrategy
      end

      it 'uses RejectStrategy when second argument is :reject' do
        middleware = described_class.new(app, :reject)
        expect(middleware.strategy).to be_a Rack::EncodingGuard::RejectStrategy
      end

      it 'forwards the given options to the RejectStrategy object' do
        options = { message: 'Test' }
        middleware = described_class.new(app, :reject, options)
        expect(middleware.strategy.options).to eq options
      end

      it 'uses SanitizeStrategy when second argument is :sanitize' do
        middleware = described_class.new(app, :sanitize)
        expect(middleware.strategy).to be_a Rack::EncodingGuard::SanitizeStrategy
      end

      it 'uses the class specified as second argument' do
        strategy_class = Rack::EncodingGuard::SanitizeStrategy
        middleware = described_class.new(app, strategy_class)
        expect(middleware.strategy).to be_a strategy_class
      end

      it 'uses the constantized String specified as second argument' do
        middleware = described_class.new(app, 'Rack::EncodingGuard::SanitizeStrategy')
        expect(middleware.strategy).to be_a Rack::EncodingGuard::SanitizeStrategy
      end

      it 'raises if an object of invalid type is specified as second argument' do
        expect { described_class.new(app, 0) }.to raise_error(
          ArgumentError, "Invalid strategy: 0"
        )
      end

      it 'uses any object responding to #process as strategy' do
        strategy = double
        allow(strategy).to receive(:process).and_return('Strategy Result')

        middleware = described_class.new(app, strategy)
        expect(middleware.strategy).to eq strategy
      end

      it 'raises if an object not responding to #process is given as ' \
         'strategy' do
        expect { described_class.new(app, double) }.to raise_error(
          ArgumentError, /Invalid strategy/
        )
      end
    end
  end

  describe '#call' do
    it 'returns the result of the process method of the used strategy' do
      strategy = double('Strategy')
      allow(strategy).to receive(:process).and_return('Strategy Result')

      middleware = described_class.new(app, strategy)
      expect(middleware.call({})).to eq 'Strategy Result'
    end
  end
end
