# frozen_string_literal: true

require File.expand_path("config/boot", File.dirname(__FILE__))
# require 'sprockets'
# require 'uglifier'
# require 'sass'
# require 'coffee-script'
# require 'execjs'

class App < Sinatra::Base
  def self.initialize!

    set :name, "datawolf"
    set :session_secret, ENV.fetch("SESSION_SECRET") { SecureRandom.hex(64) }
    set :sprock, Sprockets::Environment.new

    sprock.append_path "assets/stylesheets"
    sprock.append_path "assets/javascripts"

    # sprock.js_compressor  = :uglify
    sprock.css_compressor = :scss

    get "/assets/*" do
      env["PATH_INFO"].sub!("/assets", "")
      settings.sprock.call(env)
    end

    Dir["#{App.root}/lib/**/*.rb"].sort.each { |file| require file }
    Dir["#{App.root}/config/initializers/**/*.rb"].sort.each { |file| require file }
    require "registry"
    Dir["#{App.root}/{app,web_app}/**/*.rb"].sort.each { |file| require file }

    disable :show_exceptions

    helpers ::Sinatra::AutheHelper

    configure :development do
      use BetterErrors::Middleware
      BetterErrors.application_root = File.expand_path('..', __FILE__)
    end


    configure do
      # use Rack::ShowExceptions
      # use Rack::Lint

      # use ::Sinatra::DatadogMiddleware, Clients.datadog, settings.name
      use ::Sinatra::WaitMiddleware
      use ::Sinatra::RequestIdMiddleware
      use ::Sinatra::CommonLoggerMiddleware, STDOUT
      use ::Rollbar::Middleware::Sinatra if ENV["ROLLBAR_TOKEN"]
    end

    before { env["rack.errors"] = Clients.logger }


    # register ::Datadog::Contrib::Sinatra::Tracer

    # Routes.constants.sort.map { |module_name| use Routes.const_get(module_name) }
  end
end

App.initialize!

# pp Telegram.get_updates.chats
