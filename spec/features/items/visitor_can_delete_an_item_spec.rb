RSpec.describe 'Visitors' do
  context 'who click delete button' do
    it 'should delete an existing item and should be redirected item index page' do
      Merchant.create(name: 'Dingle')

      item = Item.create(title: 'Sabrina',
                         description: 'Awesome',
                         price: '100',
                         merchant_id: 1)

      expect(Item.count).to eq(1)

      visit("/items/#{item.id}")

      click_button('Delete')

      expect(current_path).to eq('/items')
      expect(page).to_not have_content('Sabrina')
      expect(Item.count).to eq(0)
    end
  end
end
