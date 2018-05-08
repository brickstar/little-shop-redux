require 'pry'
RSpec.describe 'Visitors' do
  context 'who click delete button' do
    it 'should delete specified invoice and redirected to invoice index' do

      invoice_1 = Invoice.create(status: 'pending', merchant_id: 12335938)
      invoice_2 = Invoice.create(status: 'returned', merchant_id: 12335456)
      invoice_3 = Invoice.create(status: 'shipped', merchant_id: 12335678)

      expect(Invoice.count).to eq(3)

      visit('/invoices')

      within ".invoice-#{invoice_2.id}" do
        click_button('Delete')
      end

      expect(current_path).to eq('/invoices')
      
      expect(Invoice.count).to eq(2)
      expect(page).to_not have_content('12335456')
      expect(page).to have_content('12335678')
    end
  end
end
