require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'basit')
  end

  after(:each) do
    User.destroy_all
  end

  it 'should create a user' do
    @user = User.create(name: 'basit')
  end
end