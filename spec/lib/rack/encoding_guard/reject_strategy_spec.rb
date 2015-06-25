require 'spec_helper'

describe Rack::EncodingGuard::RejectStrategy do
  include_examples 'Strategy'

  let! :rack_env do
    Rack::MockRequest.env_for('http://example.com/some/path?and=query&string=set')
  end

  context 'with valid environment' do
    pending
  end

  context 'with invalid HTTP_REFERER' do
    before do
      rack_env['HTTP_REFERER'] = "http://example.com/so\255me/ref\255erer/path"
    end

    pending
  end

  context 'with invalid PATH_INFO' do
    before do
      rack_env['PATH_INFO'] = "/some/pa\255th"
    end

    pending
  end

  context 'with invalid REQUEST_URI' do
    before do
      rack_env['REQUEST_URI'] = "/so\255me/request/path?a\255nd=query"
    end

    pending
  end

  context 'with invalid REQUEST_PATH' do
    before do
      rack_env['PATH_INFO'] = "/some/pa\255th"
    end

    pending
  end

  context 'with invalid QUERY_STRING' do
    before do
      rack_env['QUERY_STRING'] = "and=que\255ry&str\255ing=set"
    end

    pending
  end
end
