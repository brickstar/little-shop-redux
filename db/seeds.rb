require './app/models/merchant.rb'
require 'csv'
require 'pry'
binding.pry
CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |m|
  Merchant.create(m.to_hash)
end
