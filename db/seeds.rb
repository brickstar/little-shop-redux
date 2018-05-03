require './app/models/merchant.rb'
require 'csv'
require 'pry'

require File.expand_path("../../config/environment", __FILE__)
CSV.foreach('./data/merchants.csv',
  headers: true,
  header_converters: :symbol) do |merchant|

  Merchant.create(id: merchant[:id],
    name: merchant[:name],
    created_at: merchant[:created_at],
    updated_at: merchant[:updated_at])
end

# CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |m|
#   Merchant.create(m.to_hash)
# end
#
# CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |m|
#   Merchant.create(m.to_hash)
# end
