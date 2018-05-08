RSpec.describe 'Visitors' do
  context 'who visit /invoices/:id' do
    it 'should see a single invoice' do

      invoice_1 = Invoice.create(merchant_id: 1, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 2, status: 'shipped')
      invoice_3 = Invoice.create(merchant_id: 3, status: 'pending')

      visit("/invoices/#{invoice_1.merchant_id}")

      expect(page).to have_content(invoice_1.merchant_id)

      visit("/invoices/#{invoice_2.merchant_id}")
      expect(page).to have_content(invoice_2.merchant_id)

      visit("/invoices/#{invoice_3.merchant_id}")
      expect(page).to have_content(invoice_3.merchant_id)
    end
  end
end
