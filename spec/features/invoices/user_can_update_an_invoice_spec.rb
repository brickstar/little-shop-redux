RSpec.describe 'Visitors' do
  context 'who click edit button' do
    xit 'should update an existing invoice and should be redirected to invoice page' do
      invoice = Invoice.create(status: 'pending', merchant_id: 12335938)

      visit('/invoices')

      click_link('Edit')

      expect(current_path).to eq("/invoices/#{invoice.merchant_id}/edit")
      fill_in 'status', with: 'Returned'

      click_button('Update Invoice')

      expect(page).to have_content('Returned')

      expect(current_path).to eq("/invoices/#{invoice.merchant_id}")
    end
  end
end
