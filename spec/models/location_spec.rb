require 'rails_helper'

describe Location, type: :model do
  describe "validations" do
    it {should validate_presence_of(:nick_name)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:high_temp)}
    it {should validate_presence_of(:low_temp)}
  end

  describe "relationships" do
    it {should have_many(:favorites)}
    it {should have_many(:users).through(:favorites)}
  end
end
