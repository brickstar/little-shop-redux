RSpec.describe 'Visitors' do
  context 'who visit /merchants/:id' do
    it 'should see a single merchant' do

      merchant_1 = Merchant.create(name: 'Subreenuh')
      merchant_2 = Merchant.create(name: 'ROBBB')
      merchant_3 = Merchant.create(name: 'Mike')

      visit("/merchants/single_merchant/#{merchant_1.id}")
      expect(page).to have_content(merchant_1.name)

      visit("/merchants/single_merchant/#{merchant_2.id}")
      expect(page).to have_content(merchant_2.name)

      visit("/merchants/single_merchant/#{merchant_3.id}")    
      expect(page).to have_content(merchant_3.name)
    end
  end
end
