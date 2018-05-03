require './app/models/merchant.rb'
require './app/models/invoice.rb'
require './app/models/item.rb'
require 'csv'
require 'pry'

<<<<<<< HEAD
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
=======
CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  Merchant.create(id: merchant[:id],
    name: merchant[:name],
    created_at: merchant[:created_at],
    updated_at: merchant[:updated_at])
end

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |invoice|
  Invoice.create(id: invoice[:id],
    merchant_id: invoice[:merchant_id],
    status: invoice[:status],
    created_at: invoice[:created_at],
    updated_at: invoice[:updated_at])
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(id: item[:id],
    title: item[:name],
    description: item[:description],
    price: item[:unit_price],
    image: 'image',
    created_at: item[:created_at],
    updated_at: item[:updated_at])
end
>>>>>>> e703732caea57c27bcc125afb4526d67fc9ddd7e
