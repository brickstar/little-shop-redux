require 'pry'
class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: false
  belongs_to :merchant

  def self.total_count
    all.count
  end

  def self.average_price
    average(:price)
  end

  def self.newest
    order(:created_at).first
  end

  def self.oldest
    order(:created_at).last
  end
end
