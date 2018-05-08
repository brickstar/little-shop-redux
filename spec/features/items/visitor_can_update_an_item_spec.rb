RSpec.describe 'Visitors' do
  context 'who click edit button' do
    it 'should update an existing item and should be redirected to said item page' do
      merchant = Merchant.create(name: 'Dingle')

      item = Item.create(title: 'Sabrina', description: 'Awesome', price: '100', merchant_id: "#{merchant.id}")

      visit("/items/#{item.id}")

      click_link('Edit')
      expect(current_path).to eq("/items/#{item.id}/edit")

      fill_in "title", with: 'Pearly'
      fill_in "description", with: 'Adorable'
      fill_in "price", with: '1000000'

      click_button('Update Item')

      expect(page).to have_content('Pearly')

      expect(current_path).to eq("/items/#{item.id}")
    end
  end
end
