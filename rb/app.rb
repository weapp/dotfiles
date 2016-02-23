#!/usr/bin/env ruby

require "logger"
require "bundler/setup"

Bundler.require(:default, ENV["APP_ENV"] || "development")
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

class App
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  def self.run
  end
end

App.run if __FILE__ == $PROGRAM_NAME

