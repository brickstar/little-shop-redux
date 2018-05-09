require 'pry'
RSpec.describe 'Visitors' do
  context 'who visit /invoices' do
    it 'should see all invoices' do
      invoice = Invoice.create(merchant_id: '12335938', status: 'pending')

      visit('/invoices')

      expect(page).to have_content(invoice.merchant_id)
    end
  end

  context 'who visit /invoices/:id' do
    it 'should see a single invoice' do
      invoice1 = Invoice.create(merchant_id: 1, status: 'pending')
      invoice2 = Invoice.create(merchant_id: 2, status: 'shipped')
      invoice3 = Invoice.create(merchant_id: 3, status: 'pending')

      visit("/invoices/#{invoice1.merchant_id}")

      expect(page).to have_content(invoice1.merchant_id)

      visit("/invoices/#{invoice2.merchant_id}")
      expect(page).to have_content(invoice2.merchant_id)

      visit("/invoices/#{invoice3.merchant_id}")
      expect(page).to have_content(invoice3.merchant_id)
    end
  end

  context 'who click edit button' do
    it 'should update an existing invoice and should be redirected to invoice page' do
      invoice = Invoice.create(status: 'pending', merchant_id: 12_335_938)

      visit('/invoices')

      click_link('Edit')

      expect(current_path).to eq("/invoices/#{invoice.id}/edit")

      select('Returned', from: 'status-dropdown')

      click_button('Update Invoice')

      expect(page).to have_content('Returned')

      expect(current_path).to eq("/invoices/#{invoice.id}")
    end
  end

  context 'who click delete button' do
    it 'should delete specified invoice and redirected to invoice index' do
      invoice1 = Invoice.create(status: 'pending', merchant_id: 12_335_938)
      invoice2 = Invoice.create(status: 'returned', merchant_id: 12_335_456)
      invoice3 = Invoice.create(status: 'shipped', merchant_id: 12_335_678)

      expect(Invoice.count).to eq(3)

      visit('/invoices')

      within ".invoice-#{invoice2.id}" do
        click_button('Delete')
      end

      expect(current_path).to eq('/invoices')

      expect(Invoice.count).to eq(2)
      expect(page).to_not have_content('12335456')
      expect(page).to have_content('12335678')
    end
  end

  context 'who click cancel button from invoice edit page' do
    it 'should be redirected to invoice page' do
      invoice = Invoice.create(status: 'pending', merchant_id: 12_335_938)

      visit("/invoices/#{invoice.id}/edit")

      click_link('Cancel')

      expect(current_path).to eq("/invoices/#{invoice.id}")
    end
  end
end
