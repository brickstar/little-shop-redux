RSpec.describe 'Visitors' do
  context 'who visit /merchants/:id' do
    merchant_1 = Merchant.create!(name: 'Subreenuh')
    merchant_2 = Merchant.create(name: 'ROBBB')
    merchant_3 = Merchant.create(name: 'Mike')

    visit("/merchants/#{merchant_1.id}")
    visit("/merchants/#{merchant_2.id}")
    visit("/merchants/#{merchant_3.id}")

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)
  end
end
