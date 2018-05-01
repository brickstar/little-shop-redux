ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'simplecov'
SimpleCov.start

Capybara.app = LittleShopApp

RSpec.configure do |c|
  c.include Capybara::DSL
end
