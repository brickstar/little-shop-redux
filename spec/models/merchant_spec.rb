RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.create(name: nil)

      expect(merchant).to_not be_valid
    end
    it 'is valid with a name' do
      merchant = Merchant.create(name: 'Bob')

      expect(merchant).to be_valid
    end
  end
end

  describe 'Class Methods' do
    context '.merchant_item_info' do
      it "should return total cost, items count and average price" do

      merchant = Merchant.create!(name: 'Subreenah')

      item_1 = Item.create!(title: 'Polyphonic Spree',
                           description: 'Symphonic Psych Rock',
                           price: 10,
                           image: 'https://www.polyphonicspree.com',
                           merchant_id: 1)
      item_2 = Item.create!(title: 'Heartless Bastards',
                           description: 'Rock',
                           price: 20,
                           image: 'https://www.heartlessbastards.com',
                           merchant_id: 1)
      item_3 = Item.create!(title: 'The Black Angels',
                           description: 'Psych Rock',
                           price: 30,
                           image: 'https://www.blackangels.com',
                           merchant_id: 1)

      total_cost = item_1.price + item_2.price + item_3.price
      item_count = 3
      average_price = total_cost / item_count

      expect(Merchant.merchant_item_info[0].total_cost).to eq(total_cost)
      expect(Merchant.merchant_item_info[0].items_count).to eq(item_count)
      expect(Merchant.merchant_item_info[0].average_price).to eq(average_price)
    end
  end
end
