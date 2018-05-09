RSpec.describe 'Visitors' do
  context 'who click cancel button from item new page' do
    it 'should be redirected to item index page' do

      visit("/items/new")

      click_link('Cancel')

      expect(current_path).to eq("/items")
    end
  end
end
