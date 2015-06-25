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

    context 'with custom strategy' do
      it 'uses RejectStrategy when second argument is nil' do
        middleware = described_class.new(app, nil)
        expect(middleware.strategy).to eq Rack::EncodingGuard::RejectStrategy
      end

      it 'uses RejectStrategy when second argument is :reject' do
        middleware = described_class.new(app, :reject)
        expect(middleware.strategy).to eq Rack::EncodingGuard::RejectStrategy
      end

      it 'uses SanitizeStrategy when second argument is :sanitize' do
        middleware = described_class.new(app, :sanitize)
        expect(middleware.strategy).to eq Rack::EncodingGuard::SanitizeStrategy
      end

      it 'uses the class specified as second argument' do
        strategy = Rack::EncodingGuard::SanitizeStrategy
        middleware = described_class.new(app, strategy)
        expect(middleware.strategy).to eq strategy
      end

      it 'uses the constantized String specified as second argument' do
        middleware = described_class.new(app, 'Rack::EncodingGuard::SanitizeStrategy')
        expect(middleware.strategy).to eq Rack::EncodingGuard::SanitizeStrategy
      end
    end
  end

  describe '#call' do
    pending
  end
end
