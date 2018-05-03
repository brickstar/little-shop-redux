RSpec.describe Item do
  describe 'Validations' do
    it 'is invalid without a title' do
      item = Item.create(title: nil, description: 'yo yo', price: 47, image: 'valid')

      expect(item).to_not be_valid
    end
    it 'is valid with a title' do
      item = Item.create(title: 'Bob', description: 'yo yo', price: 47, image: 'valid')

      expect(item).to be_valid
    end
  end
end
