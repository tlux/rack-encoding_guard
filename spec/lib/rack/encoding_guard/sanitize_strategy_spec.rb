require 'spec_helper'

describe Rack::EncodingGuard::SanitizeStrategy do
  include_examples 'Strategy'

  let! :env do
    Rack::MockRequest.env_for('http://example.com/some/path?and=query&string=set')
  end

  let :app_response do
    [200, {}, ['Default']]
  end

  context 'with valid environment' do
    it 'cascades to the app response' do
      strategy = described_class.new
      expect(strategy.process(env) { app_response }).to eq app_response
    end
  end

  INVALID_ENV_VARS = {
    'HTTP_REFERER' => ["http://example.com/so\255me/ref\255erer/path",
                       'http://example.com/some/referer/path'],
    'PATH_INFO'    => ["/some/pa\255th", '/some/path'],
    'REQUEST_URI'  => ["/so\255me/request/path?a\255nd=query",
                       '/some/request/path?and=query'],
    'REQUEST_PATH' => ["/some/pa\255th", '/some/path'],
    'QUERY_STRING' => ["and=que\255ry&str\255ing=set", 'and=query&string=set']
  }

  INVALID_ENV_VARS.each do |name, (invalid_value, valid_value)|
    context "with invalid #{name}" do
      before do
        env[name] = invalid_value
      end

      subject(:strategy) { described_class.new }

      it 'cascades to app response' do
        expect(strategy.process(env) { app_response }).to eq app_response
      end

      it "strips invalid characters from #{name}" do
        strategy.process(env) { app_response }
        expect(env[name]).to eq valid_value
      end
    end
  end
end
