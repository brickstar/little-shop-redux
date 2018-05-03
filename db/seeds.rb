require_relative '../app/models/merchant.rb'
require 'csv'
require 'pry'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |m|
  binding.pry
  Merchant.create(m.to_hash)
end
