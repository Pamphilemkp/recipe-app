require 'rails_helper'

RSpec.describe Food, type: :model do
  # tests go here
  @user = User.create(name: 'Pamphile', email: 'pelico@gmail.com', password: '123456')
  subject do
    Recipe.new(user_id: @user, name: 'Fufu', preparation_time: 1, cooking_time: 3,
               description: 'delicious')
  end

  before { subject.save }

  it 'recipe user to be the user that created it' do
    expect(subject.user).to be == @user
  end

  it 'name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'the preparation_time must be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'the cooking_time must be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'the description must be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end
end
