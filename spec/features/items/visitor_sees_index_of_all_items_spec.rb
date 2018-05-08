RSpec.describe 'Visitors' do
  context 'who visit /items' do
    it 'should see a list of all items' do
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

      items = [item_1, item_2, item_3]

      visit('/items')
      
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.price)
      expect(page).to have_content(item_3.description)
    end
  end
end
