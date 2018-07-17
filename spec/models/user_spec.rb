require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email_address)}
    it {should validate_uniqueness_of(:email_address)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:high_pref)}
    it {should validate_presence_of(:low_pref)}
  end

  describe "relationships" do
    it {should have_many(:favorites)}
    it {should have_many(:locations).through(:favorites)}
  end

  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create(user_name: 'Emmie', password: 'password', role: 1)
      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end

    it 'can be created as a default user' do
      user = User.create(user_name: 'Bob', password: 'test123', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
