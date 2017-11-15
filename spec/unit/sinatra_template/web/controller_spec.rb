# frozen_string_literal: true

require 'spec_helper'
require 'sinatra_template/web/controller'

describe SinatraTemplate::Web::Controller do
  include Rack::Test::Methods

  def app
    SinatraTemplate::Web::Controller
  end

  it 'has a root page' do
    get '/'
    expect(last_response).to be_ok
  end

  context 'requesting a form' do
    context 'with a URL that is NOT whitelisted' do
      let(:url_to_render) { 'http://example.com' }

      it 'responds with a basic auth challenge' do
        post '/', url: url_to_render
        expect(last_response.status).to eq(401)
      end
    end
  end
end
