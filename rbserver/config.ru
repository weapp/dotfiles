# frozen_string_literal: true

require File.expand_path("app", File.dirname(__FILE__))

run Rack::URLMap.new(
  "/"        => App,
  # "/sidekiq" => Sidekiq::Web
)
