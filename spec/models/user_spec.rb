require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email_address)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:high_pref)}
    it {should validate_presence_of(:low_pref)}
  end

  describe "relationships" do
    it {should have_many(:favorites)}
    it {should have_many(:locations).through(:favorites)}
  end
end
