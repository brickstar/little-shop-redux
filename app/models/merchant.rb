class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :items
  has_many :invoices

  def self.merchant_item_info
    Merchant.joins(:items).select("merchants.*, sum(items.price)
    AS total_cost, count(items.id) AS items_count, avg(items.price)
    AS average_price").group("merchants.id")
  end
end
