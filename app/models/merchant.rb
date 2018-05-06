class Merchant < ActiveRecord::Base
  validates :name, presence: true

  def self.delete
    merchant = Merchant.find(params[:id])
    merchant.delete
  end
end
