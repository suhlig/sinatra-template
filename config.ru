# frozen_string_literal: true

$LOAD_PATH.unshift File.join(__dir__, 'lib')

require 'sinatra_template/web/controller'

run Rack::URLMap.new(
  '/' => SinatraTemplate::Web::Controller,
)
