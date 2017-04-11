#!/usr/bin/env ruby


%w(logger json ostruct bundler/setup).each(&method(:require))

Bundler.require(:default, ENV["APP_ENV"] || "development")
$LOAD_PATH.unshift("#{__dir__}/lib")
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].sort.each { |file| require file }
Dotenv.load

class App
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  def self.debug(obj)
    Pry::ColorPrinter.pp(obj)
    obj
  end

  def self.run
  end

  def self.env
    ENV["APP_ENV"] || "development"
  end
end

App.run if __FILE__ == $PROGRAM_NAME

