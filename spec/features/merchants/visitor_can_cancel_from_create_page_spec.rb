RSpec.describe 'Visitors' do
  context 'who click cancel button from merchant new page' do
    it 'should be redirected to merchant index page' do

      expect(Merchant.count).to eq(0)

      visit('/merchants')

      click_link('Create A New Merchant')

      expect(current_path).to eq('/merchants/new')

      click_link('Cancel')

      expect(Merchant.count).to eq(0)

      expect(current_path).to eq('/merchants')
    end
  end
end
