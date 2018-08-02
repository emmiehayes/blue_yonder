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

  describe "class methods" do
    before :each do
      @user = User.create!(name: 'Testing', email_address: 'testing@gmail.com', password: 'test123', high_pref: 81, low_pref: 68)
      @location_1 = Location.create!(nick_name: 'Denver', state: 'Colorado', high_temp: 100, low_temp: 90)
      @location_2 = Location.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: 80, low_temp: 70)
      @location_3 = Location.create!(nick_name: 'Steamboat Springs', state: 'Colorado', high_temp: 70, low_temp: 50)
      @location_4 = Location.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: 80, low_temp: 70)
      end

    context '.temp_match' do
      it 'returns the names of all locations that match user preferences' do

        expect(Location.temp_match(@user)).to eq([@location_2,@location_4])
      end
    end
  end
end
