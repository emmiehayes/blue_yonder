require 'rails_helper'

describe 'user favorites location' do
  before(:each) do
    @user_1 = User.create!(name: 'Emmie', email_address: 'emmie@google.com', password: 'asgaesdg', high_pref: 0, low_pref: 0)
    @location_1 = @user_1.locations.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: '80', low_temp: '60')

    visit user_path(@user_1)
    fill_in 'user_high_pref', with: 80
    fill_in 'user_low_pref', with: 60
    click_on 'Submit'
    expect(current_path).to eq(user_path(@user_1))
  end

  it 'populates location under favorite spots when heart is clicked' do
    #TODO NEED FIND OR WITHIN BLOCK HERE
    expect(current_path).to eq(user_path(@user_1))
    expect(page).to have_content("Today's Options: #{@location}")
    expect(page).to have_content("Favorites: #{@location}")
    expect(Favorite.find_by(user_id: @user_1.id).location).to eq(@location_1)
  end

  it 'removes location from favorite spots when heart is un-clicked' do
    #TODO NEED FIND OR WITHIN BLOCK HERE
    expect(current_path).to eq(user_path(@user_1))
    expect(page).to have_content("Today's Options: #{@location}")
    expect(page).to have_content("Favorites: #{@location}")
    expect(Favorite.find_by(user_id: @user_1.id).location).to eq(@location_1)
  end
end
