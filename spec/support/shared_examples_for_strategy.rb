require 'spec_helper'

shared_examples 'Strategy' do
  let :env do
    Rack::MockRequest.env_for('http://example.com/some/path?and=query')
  end

  describe '.new' do
    it 'takes a options as argument' do
      options = { option_1: true, option_2: false }
      strategy = described_class.new(options)
      expect(strategy.options).to eq options
    end
  end

  describe '#process' do
    it 'raises without block given' do
      expect { described_class.new.process(env) }.to raise_error LocalJumpError
    end
  end
end
