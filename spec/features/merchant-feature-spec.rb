RSpec.describe 'Visitors' do
  context 'who visit /merchants' do
    it 'should see all merchants' do
      merchant1 = Merchant.create(name: 'Subreenuh')
      merchant2 = Merchant.create(name: 'ROBBB')
      merchant3 = Merchant.create(name: 'Mike')

      visit('/merchants')

      expect(page).to have_content(merchant1.name)
      expect(page).to have_content(merchant2.name)
      expect(page).to have_content(merchant3.name)
    end
  end

  context 'who visit /merchants/:id' do
    it 'should see a single merchant' do
      merchant1 = Merchant.create(name: 'Subreenuh')
      merchant2 = Merchant.create(name: 'ROBBB')
      merchant3 = Merchant.create(name: 'Mike')

      visit("/merchants/#{merchant1.id}")
      expect(page).to have_content(merchant1.name)

      visit("/merchants/#{merchant2.id}")
      expect(page).to have_content(merchant2.name)

      visit("/merchants/#{merchant3.id}")
      expect(page).to have_content(merchant3.name)
    end
  end

  context 'who click create new merchant button' do
    it 'should create a new merchant and should be redirected to said merchant page' do
      expect(Merchant.count).to eq(0)

      visit('/merchants')

      click_link('Create A New Merchant')

      expect(current_path).to eq('/merchants/new')

      fill_in 'name', with: 'Pearly'

      click_button('Create Merchant')

      expect(page).to have_content('Pearly')

      expect(Merchant.count).to eq(1)

      expect(current_path).to eq('/merchants')
    end
  end

  context 'who click edit button' do
    it 'should update an existing merchant and should be redirected to said merchant page' do
      merchant = Merchant.create(name: 'Sabrina')

      visit('/merchants')

      click_link('Edit')

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")

      fill_in 'merchant[name]', with: 'Pearly'

      click_button('Update Merchant')

      expect(page).to have_content('Pearly')

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end

  context 'who click delete button' do
    it 'should delete specified merchant and redirected to merchant index' do
      merchant1 = Merchant.create(name: 'Subreenuh')
      merchant2 = Merchant.create(name: 'ROBBB')
      merchant3 = Merchant.create(name: 'MAHTTTT')

      expect(Merchant.count).to eq(3)

      visit('/merchants')

      within ".merchant-#{merchant2.id}" do
        click_button('Delete')
      end

      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(2)
      expect(page).to_not have_content('ROBBB')
      expect(page).to have_content('MAHTTTT')
    end
  end

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

  context 'who click cancel button from merchant edit page' do
    it 'should be redirected to merchant page' do
      merchant = Merchant.create(name: 'Matt')

      visit("/merchants/#{merchant.id}/edit")

      click_link('Cancel')

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end
end
