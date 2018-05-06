RSpec.describe 'Visitors' do
  context 'who click create new merchant button' do
    it 'should create a new merchant and should be redirected to said merchant page' do

      expect(Merchant.count).to eq(0)

      visit('/merchants')

      click_link('Create A New Merchant')

      expect(current_path).to eq('/merchants/new')

      fill_in 'Name', with: 'Pearly'

      click_button('Create Merchant')

      expect(page).to have_content('Pearly')

      expect(Merchant.count).to eq(1)

      expect(current_path).to eq('/merchants')
    end
  end
end
