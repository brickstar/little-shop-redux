RSpec.describe 'Visitors' do
  context 'who click create new merchant button' do
    it 'should create a new merchant and should be redirected to said merchant page' do

      expect(Item.count).to eq(0)

      visit('/items')

      click_link('Create A New Item')

      expect(current_path).to eq('/items/new')

      # fill_in "name", with: 'Pearly'
      #
      # click_button('Create Merchant')
      #
      # expect(page).to have_content('Pearly')

      expect(Item.count).to eq(1)

      expect(current_path).to eq('/items')
    end
  end
end
