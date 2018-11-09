require "simplecov"
SimpleCov.start

ENV["APP_ENV"] ||= "test"
require ::File.expand_path("../../app", __FILE__)
