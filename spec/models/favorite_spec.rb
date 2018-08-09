require 'rails_helper'

describe Favorite, type: :model do
  describe "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:location)}
  end
end

describe "class methods" do
  before :each do
    @user_1 = User.create!(name: 'Emmie', email_address: 'maybe@gmail.com', password: 'test12366')
    @user_2 = User.create!(name: 'Bob', email_address: 'no@gmail.com', password: 'test45666')
    @location_1 = Location.create!(nick_name: 'Vail', state: 'Colorado', high_temp: 70, low_temp: 50)
    @location_2 = Location.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: 80, low_temp: 70)
    @location_3 = Location.create!(nick_name: 'Denver', state: 'Colorado', high_temp: 70, low_temp: 60)
    @favorite_1 = Favorite.create!(user_id: 1, location_id: 3)
    @favorite_2 = Favorite.create!(user_id: 1, location_id: 2)
    @favorite_3 = Favorite.create!(user_id: 2, location_id: 2)
    end

  context '.group_by_location' do
    it 'returns the location that has been favorited by the most users' do
      expect(Favorite.group_by_location).to eq({"Denver"=>1, "Boulder"=>2})
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

  context '.most_favorite' do
    it 'returns the location nick_name for the most favorited by users' do
      expect(Favorite.most_favorite).to eq('Boulder')
    end
  end
end
