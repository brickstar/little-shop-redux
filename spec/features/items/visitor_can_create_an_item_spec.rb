RSpec.describe 'Visitors' do
  context 'who click create new item button' do
    it 'should create a new item and should be redirected to item page' do

      expect(Item.count).to eq(0)

      visit('/items')

      click_link('Create A New Item')

      expect(current_path).to eq('/items/new')

      fill_in "title", with: 'Pearly'

      click_button('Create Item')

      expect(page).to have_content('Pearly')

      expect(Item.count).to eq(1)

      expect(current_path).to eq('/items')
    end
  end
end
