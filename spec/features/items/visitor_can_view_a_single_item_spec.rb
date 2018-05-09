RSpec.describe 'Visitors' do
  context 'who visit single item page' do
    it 'should see specified' do
    merchant = Merchant.create(name: 'Dingle')

    item = Item.create(title: 'Polyphonic Spree',
                       description: 'Symphonic Psych Rock',
                       price: 47,
                       image: 'https://scontent.fapa1-2.fna.fbcdn.net/v/t1.0-9/10805549_10103045619585970_9196776473465068702_n.jpg?_nc_cat=0&oh=1cade5602e52f32a727afde9cc364b3b&oe=5B90FDEE',
                       merchant_id: 1)
                       
      visit("/items/#{item.id}")

      expect(page).to have_content(item.title)
    end
  end
end
