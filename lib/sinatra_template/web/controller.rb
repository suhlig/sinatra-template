# frozen_string_literal: true

require 'sinatra/base'

module SinatraTemplate
  module Web
    class Controller < Sinatra::Base
      set :root, File.join(File.dirname(__FILE__), '..', '..', '..')
      set :views, settings.root + '/views'

      configure :production, :development do
        enable :logging
      end

      get '/' do
        erb :index, layout: true, locals: {
          title: 'SinatraTemplate',
          url: url,
        }
      end

      post '/' do
        url = params[:url]
        halt 422, "Error: Mandatory parameter 'url' is missing" if url.empty?
        protected!
        "Thanks for #{url}"
      end

      def protected!
        return if authorized?
        headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
        halt 401, 'Not authorized'
      end

      def authorized?
        @auth ||= Rack::Auth::Basic::Request.new(request.env)
        @auth.provided? && @auth.basic? && @auth.credentials && !@auth.credentials.first.empty?
      end
    end
  end
end
