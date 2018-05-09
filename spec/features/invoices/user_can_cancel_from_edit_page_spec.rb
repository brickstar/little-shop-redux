RSpec.describe 'Visitors' do
  context 'who click cancel button from invoice edit page' do
    it 'should be redirected to invoice page' do
      invoice = Invoice.create(status: 'pending', merchant_id: 12_335_938)

      visit("/invoices/#{invoice.id}/edit")

      click_link('Cancel')

      expect(current_path).to eq("/invoices/#{invoice.id}")
    end
  end
end
