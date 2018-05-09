RSpec.describe 'Visitors' do
  context 'who click cancel button from item edit page' do
    it 'should be redirected to item page' do
      merchant = Merchant.create(name: 'Dingle')

      item = Item.create(title: 'Sabrina',
                         description: 'Awesome',
                         price: '100',
                         merchant_id: 1)

      visit("/items/#{item.id}/edit")

      click_link('Cancel')

      expect(current_path).to eq("/items/#{item.id}")
    end
  end
end
