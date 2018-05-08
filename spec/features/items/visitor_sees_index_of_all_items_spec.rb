RSpec.describe 'Visitors' do
  context 'who visit /items' do
    it 'should see a list of all items' do
      item_1 = Item.create(title: 'Polyphonic Spree',
                           description: 'Symphonic Psych Rock',
                           price: 47,
                           image: 'polyphonicspree.com')
      item_2 = Item.create(title: 'Heartless Bastards',
                           description: 'Rock',
                           price: 13,
                           image: 'heartlessbastards.com')
      item_3 = Item.create(title: 'The Black Angels',
                           description: 'Psych Rock',
                           price: 77,
                           image: 'blackangels.com')

      items = [item_1, item_2, item_3]

      visit('/items')

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_3.title)
    end
  end
end
