RSpec.describe 'Visitors' do
  context 'who visit /merchants' do
    it 'should see all merchants' do
      merchant_1 = Merchant.create(name: 'Subreenuh')
      merchant_2 = Merchant.create(name: 'ROBBB')
      merchant_3 = Merchant.create(name: 'Mike')

      visit('/merchants')

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content(merchant_3.name)
    end
  end
end
