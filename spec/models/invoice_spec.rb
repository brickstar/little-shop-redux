RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without a merchant_id' do
      invoice = Invoice.create(merchant_id: nil, status: 'pending')

      expect(invoice).to_not be_valid
    end
    it 'is valid with a merchant_id' do
      invoice = Invoice.create(merchant_id: 1, status: 'pending')

      expect(invoice).to be_valid
    end
  end
end
