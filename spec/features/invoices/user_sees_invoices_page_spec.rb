require 'pry'
RSpec.describe 'Visitors' do
  context 'who visit /invoices' do
    it 'should see all invoices' do
      invoice = Invoice.create(merchant_id: '12335938', status: 'pending')

      visit('/invoices')

      expect(page).to have_content(invoice.merchant_id)
    end
  end
end
