require 'spec_helper'

shared_examples 'Strategy' do
  let :rack_env do
    Rack::MockRequest.env_for('http://example.com/some/path?and=query')
  end

  describe '.new' do
    it 'raises without arguments' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it 'takes a Rack environment as argument' do
      strategy = described_class.new(rack_env)
      expect(strategy.env).to eq rack_env
    end
  end
end
