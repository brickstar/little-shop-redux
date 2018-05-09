require 'pry'
class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: false
  belongs_to :merchant

  def self.total_item_count
    all.count
  end
end
