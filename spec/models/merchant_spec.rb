RSpec.describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.new(name: nil)

      expect(merchant).to_not be_valid
    end
    it "is valid with a name" do
      merchant = Merchant.new(name: 'Bob')

      expect(merchant).to be_valid
    end
  end
end
