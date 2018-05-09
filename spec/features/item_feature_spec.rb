RSpec.describe 'Visitors' do
  context 'who visit /items' do
    it 'should see a list of all items' do
      item1 = Item.create(title: 'Polyphonic Spree',
                          description: 'Symphonic Psych Rock',
                          price: 47,
                          image: 'https://www.polyphonicspree.com')
      item2 = Item.create(title: 'Heartless Bastards',
                          description: 'Rock',
                          price: 13,
                          image: 'https://www.heartlessbastards.com')
      item3 = Item.create(title: 'The Black Angels',
                          description: 'Psych Rock',
                          price: 77,
                          image: 'https://www.blackangels.com')

      visit('/items')

      expect(page).to have_content(item1.title)
      expect(page).to have_content(item2.price)
      expect(page).to have_content(item3.title)
    end
  end

  context 'who visit single item page' do
    it 'should see specified' do
      Merchant.create(name: 'Dingle')

      item = Item.create(title: 'Polyphonic Spree',
                         description: 'Symphonic Psych Rock',
                         price: 47,
                         image: 'https://scontent.fapa1-2.fna.fbcdn.net/v/t1.0-9/10805549_10103045619585970_9196776473465068702_n.jpg?_nc_cat=0&oh=1cade5602e52f32a727afde9cc364b3b&oe=5B90FDEE',
                         merchant_id: 1)

      visit("/items/#{item.id}")

      expect(page).to have_content(item.title)
    end
  end

  context 'who click create new item button' do
    it 'should create a new item and should be redirected to item page' do
      expect(Item.count).to eq(0)

      visit('/items')

      click_link('Create A New Item')

      expect(current_path).to eq('/items/new')

      fill_in 'title', with: 'Pearly'
      fill_in 'description', with: 'Adorable'
      fill_in 'price', with: '1000000'

      click_button('Create Item')

      expect(page).to have_content('Pearly')

      expect(Item.count).to eq(1)

      expect(current_path).to eq('/items')
    end
  end

  context 'who click edit button' do
    it 'should update an existing item and should be redirected to said item page' do
      Merchant.create(name: 'Dingle')

      item = Item.create(title: 'Sabrina',
                         description: 'Awesome',
                         price: '100',
                         merchant_id: 1)

      visit("/items/#{item.id}")

      click_link('Edit')
      expect(current_path).to eq("/items/#{item.id}/edit")

      select('Dingle', from: 'item[merchant_id]')
      fill_in 'item[title]', with: 'Pearly'
      fill_in 'item[description]', with: 'Adorable'
      fill_in 'item[price]', with: '1000000'

      click_button('Update Item')

      expect(page).to have_content('Pearly')

      expect(current_path).to eq("/items/#{item.id}")
    end
  end

  context 'who click delete button' do
    it 'should delete an existing item and should be redirected item index page' do
      Merchant.create(name: 'Dingle')

      item = Item.create(title: 'Sabrina',
                         description: 'Awesome',
                         price: '100',
                         merchant_id: 1)

      expect(Item.count).to eq(1)

      visit("/items/#{item.id}")

      click_button('Delete')

      expect(current_path).to eq('/items')
      expect(page).to_not have_content('Sabrina')
      expect(Item.count).to eq(0)
    end
  end

  context 'who click cancel button from item new page' do
    it 'should be redirected to item index page' do
      visit('/items/new')

      click_link('Cancel')

      expect(current_path).to eq('/items')
    end
  end

  context 'who click cancel button from item edit page' do
    it 'should be redirected to item page' do
      Merchant.create(name: 'Dingle')

      item = Item.create(title: 'Sabrina',
                         description: 'Awesome',
                         price: '100',
                         merchant_id: 1)

      visit("/items/#{item.id}/edit")

      click_link('Cancel')

      expect(current_path).to eq("/items/#{item.id}")
    end
  end
end
