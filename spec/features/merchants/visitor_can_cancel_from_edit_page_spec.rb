RSpec.describe 'Visitors' do
  context 'who click cancel button from merchant edit page' do
    it 'should be redirected to merchant page' do
      merchant = Merchant.create(name: 'Matt')

      visit("/merchants/#{merchant.id}/edit")

      click_link('Cancel')

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end
end
