RSpec.describe 'Visitors' do
  context 'who click edit button' do
    it 'should update an existing merchant and should be redirected to said merchant page' do
      merchant = Merchant.create(name: 'Sabrina')

      visit('/merchants')

      click_link('Edit')

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")

      fill_in "name", with: 'Pearly'
      save_and_open_page

      click_button('Update Merchant')

      expect(page).to have_content('Pearly')

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end
end
