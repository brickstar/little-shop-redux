require 'pry'

RSpec.describe 'Visitors' do
  context 'who click delete button' do
    it 'should delete specified merchant and redirected to merchant index' do

      merchant_1 = Merchant.create(name: 'Subreenuh')
      merchant_2 = Merchant.create(name: 'ROBBB')
      merchant_3 = Merchant.create(name: 'Mike')
      expect(Merchant.count).to eq(3)

      save_and_open_page
      click_link('delete-button')
      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(2)
    end
  end
end
