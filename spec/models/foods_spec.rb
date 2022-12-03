require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'model should be valid' do
    @user = User.create(name: 'Pamphile', email: 'pelico@gmail.com', password: '123456')
    subject { Food.new(user: @user, name: 'Pizza', measurement_unit: 'kg', quantity: 5, price: 100) }

    before { subject.save }

    it 'food user to be the user that created it' do
      expect(subject.user).to be == @user
    end

    it 'measurment_unit must be present' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'the name must be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
