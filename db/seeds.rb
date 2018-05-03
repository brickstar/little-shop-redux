require 'CSV'

merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
# invoices = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)
# items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)


merchants.each do |merchant|
  Merchant.create(id: merchant[:id],
    name: merchant[:name],
    created_at: merchant[:created_at],
    updated_at: merchant[:updated_at])
  end

  # invoices.each do |invoice|
  #   Invoice.create(id: invoice[:id],
  #     customer_id: invoice[:customer_id],
  #     merchant_id: invoice[:merchant_id],
  #     status: invoice[:status],
  #     created_at: invoice[:created_at],
  #     updated_at: invoice[:updated_at])
  #   end
  #
  #   items.each do |item|
  #     Item.create(id: item[:id],
  #       customer_id: item[:customer_id],
  #       merchant_id: item[:merchant_id],
  #       status: item[:status],
  #       created_at: item[:created_at],
  #       updated_at: item[:updated_at])
  #     end
