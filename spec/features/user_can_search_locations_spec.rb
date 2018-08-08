require 'rails_helper'

describe 'populate locations list based on user preferences' do

  it 'returns locations per user preferences' do
    user = User.create!(name: 'Emmie Hayes', email_address: 'emmie@google.com', password: 'asgaesdg', high_pref: 0, low_pref: 0)
    location_1 = Location.create!(nick_name: 'Denver', state: 'Colorado', high_temp: '100', low_temp: '90')
    location_2 = Location.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: '79', low_temp: '64')
    location_3 = Location.create!(nick_name: 'Steamboat Springs', state: 'Colorado', high_temp: '75', low_temp: '65')

    visit user_path(user)

    fill_in 'user_high_pref', with: 80
    fill_in 'user_low_pref', with: 60
    click_button 'Find Locations'

    expect(current_path).to eq(user_path(user))
    expect(page).to_not have_content(location_1.nick_name)
    expect(page).to have_content(location_2.nick_name)
    expect(page).to have_content(location_3.nick_name)
  end
end
