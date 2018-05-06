require 'pry'

RSpec.describe 'Visitors' do
  context 'who click delete button' do
    it 'should delete specified merchant and redirected to merchant index' do

      merchant_1 = Merchant.create(name: 'Subreenuh')
      merchant_2 = Merchant.create(name: 'ROBBB')
      merchant_3 = Merchant.create(name: 'MAHTTTT')

      expect(Merchant.count).to eq(3)

      visit('/merchants')

      within ".merchant-#{merchant_2.id}" do
        click_button('Delete')
      end

      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(2)
      expect(page).to_not have_content('ROBBB')
      expect(page).to have_content('MAHTTTT')
    end
  end
end
