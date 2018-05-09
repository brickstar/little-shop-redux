class Invoice < ActiveRecord::Base
  validates :customer_id, presence: false
  validates :merchant_id, presence: true
  validates :status, presence: true

  has_many :items
end
