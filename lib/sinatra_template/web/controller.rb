# frozen_string_literal: true

require 'sinatra/base'
require 'sequel'

DB = Sequel.connect(ENV.fetch('DB'))

module SinatraTemplate
  module Web
    class Controller < Sinatra::Base
      set :root, File.join(File.dirname(__FILE__), '..', '..', '..')
      set :views, settings.root + '/views'

      configure :production, :development do
        enable :logging
      end

      get '/' do
        protected!
        erb :index, layout: true, locals: {
          title: 'SinatraTemplate',
          text: @text,
        }
      end

      post '/' do
        protected!
        DB[:entries].insert(text: params[:text])
        redirect '/'
      end

    private

      def protected!
        return if authorized?
        headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
        halt 401, 'Not authorized'
      end

      def authorized?
        @auth ||= Rack::Auth::Basic::Request.new(request.env)
        @auth.provided? && @auth.basic? && @auth.credentials && !@auth.credentials.first.empty?
      end

      def entries
        DB[:entries].order(Sequel.desc(:created_at)).limit(10).all
      end
    end
  end
end
