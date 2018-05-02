ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)

require 'rspec'
require 'capybara/dsl'
require 'simplecov'
require File.expand_path("../../config/environment", __FILE__)
SimpleCov.start

Capybara.app = LittleShopApp

RSpec.configure do |c|
  c.include Capybara::DSL
end
