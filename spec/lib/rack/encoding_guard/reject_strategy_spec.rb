require 'spec_helper'

describe Rack::EncodingGuard::RejectStrategy do
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
    'HTTP_REFERER' => "http://example.com/so\255me/ref\255erer/path",
    'PATH_INFO' => "/some/pa\255th",
    'REQUEST_URI' => "/so\255me/request/path?a\255nd=query",
    'REQUEST_PATH' => "/some/pa\255th",
    'QUERY_STRING' => "and=que\255ry&str\255ing=set"
  }

  INVALID_ENV_VARS.each do |name, value|
    context "with invalid #{name}" do
      before do
        env[name] = value
      end

      it 'responds with bad request status' do
        expected_response = [400, {}, ['Bad Request']]
        strategy = described_class.new
        expect(strategy.process(env) { app_response }).to eq expected_response
      end

      context 'with response text configured' do
        it 'responds with bad request status and custom message' do
          custom_text = 'Something went wrong'
          expected_response = [400, {}, [custom_text]]
          strategy = described_class.new(with: custom_text)
          expect(strategy.process(env) { app_response }).to eq expected_response
        end
      end
    end
  end
end
