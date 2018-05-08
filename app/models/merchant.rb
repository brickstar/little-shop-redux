class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items

  def self.delete
    merchant = Merchant.find(params[:id])
    merchant.delete
  end
end
