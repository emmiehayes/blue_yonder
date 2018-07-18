require 'rails_helper'

describe Favorite, type: :model do

  describe "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:location)}
  end

  describe "class methods" do
    before(:all) do
      emmie = User.create!(name: 'Emmie', email_address: 'emmie@gmail.com', password: 'test123')
      bob = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'test456')
      denver = Location.create!(nick_name: 'Denver', state: 'Colorado', high_temp: 90, low_temp: 80)
      vail = Location.create!(nick_name: 'Vail', state: 'Colorado', high_temp: 70, low_temp: 50)
      boulder = Location.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: 80, low_temp: 70)
      favorite_1 = Favorite.create!(user_id: 1, location_id: 3)
      favorite_2 = Favorite.create!(user_id: 1, location_id: 2)
      favorite_2 = Favorite.create!(user_id: 2, location_id: 2)
    end

    context '.group_by_location' do
      it 'returns the location that has been favorited by the most users' do
        expect(Favorite.group_by_location).to eq({3=>1, 2=>2})
      end
    end

    context '.total_locations_favorited' do
      it 'returns the total number of favorited locations' do
        expect(Favorite.total_locations_favorited).to eq(2)
      end
    end

    context '.total_users_with_a_favorite' do
      it 'returns the total number users that have at least one favorite' do
        expect(Favorite.total_users_with_a_favorite).to eq(2)
      end
    end
  end
end
