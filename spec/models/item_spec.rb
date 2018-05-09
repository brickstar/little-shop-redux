RSpec.describe Item do
  describe 'Validations' do
    it 'is invalid without a title' do
      item = Item.create(title: nil, description: 'yo yo', price: 47, image: 'valid')

      expect(item).to_not be_valid
    end
    it 'is valid with a title' do
      item = Item.create(title: 'Bob', description: 'yo yo', price: 47, image: 'valid')

      expect(item).to be_valid
    end

    descirbe 'Class Methods' do
      context '.total_item_count' do
        it 'should return a total count of items'
        item_1 = Item.create(title: 'Polyphonic Spree',
                             description: 'Symphonic Psych Rock',
                             price: 47,
                             image: 'https://www.polyphonicspree.com')
        item_2 = Item.create(title: 'Heartless Bastards',
                             description: 'Rock',
                             price: 13,
                             image: 'https://www.heartlessbastards.com')
        item_3 = Item.create(title: 'The Black Angels',
                             description: 'Psych Rock',
                             price: 77,
                             image: 'https://www.blackangels.com')

        expect(Item.total_item_count).to eq(3)
      end

      context '.average_price_per_item' do
        it 'returns average price for item'
        item_1 = Item.create(title: 'Polyphonic Spree',
                             description: 'Symphonic Psych Rock',
                             price: 10,
                             image: 'https://www.polyphonicspree.com')
        item_2 = Item.create(title: 'Heartless Bastards',
                             description: 'Rock',
                             price: 20,
                             image: 'https://www.heartlessbastards.com')
        item_3 = Item.create(title: 'The Black Angels',
                             description: 'Psych Rock',
                             price: 40,
                             image: 'https://www.blackangels.com')

        expect(Item.average_price_per_item).to eq(20)
    end
  end
end
