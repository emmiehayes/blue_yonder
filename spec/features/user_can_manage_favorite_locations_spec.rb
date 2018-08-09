require 'rails_helper'

describe 'user favorites location' do
  before(:each) do
    @user = User.create!(name: 'Emmie', email_address: 'emmie@google.com', password: 'asgaesdg', high_pref: 0, low_pref: 0)
    @location = @user.locations.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: '80', low_temp: '60')
    visit user_path(@user)
  end

  xit 'adds and removes location under user\'s favorite spots when heart is clicked' do

    fill_in 'user_high_pref', with: 80
    fill_in 'user_low_pref', with: 60

    click_on 'Find Locations'

    expect(current_path).to eq(user_path(@user))

    within("#today_option-#{@location.id}") do
      expect(page).to have_content("#{@location.nick_name}")
    ########### click on heart icon WIP on testing this###############
    end

    within("#favorite_spot-#{@location.id}") do
      expect(page).to have_content("#{@location.nick_name}")
    end

    within("#today_option-#{@location.id}") do
      expect(page).to have_content("#{@location.nick_name}")
    end

    expect(Favorite.find_by(user_id: @user_1.id).location).to eq(@location_1)
    expect((Favorite.find_by(user_id: @user_1.id).location).count).to eq(1)

    within("#favorite_spot-#{@location.id}") do
      ######## click on heart icon WIP on testing this###########
    end

    expect((Favorite.find_by(user_id: @user_1.id).location).count).to eq(0)
  end
end
