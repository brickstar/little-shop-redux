RSpec.describe 'Visitors' do
  context 'who click edit button' do
    it 'should update an existing invoice and should be redirected to invoice page' do
      invoice = Invoice.create(status: 'pending', merchant_id: 12335938)

      visit('/invoices')

      click_link('Edit')

      expect(current_path).to eq("/invoices/#{invoice.id}/edit")
      save_and_open_page
      within 'Status' do
        click_on 'Returned'
      end
      # click_on 'Status', with: 'Returned'
      click_button('Update Invoice')

      expect(page).to have_content('Returned')

      expect(current_path).to eq("/invoices/#{invoice.id}")
    end
  end
end
