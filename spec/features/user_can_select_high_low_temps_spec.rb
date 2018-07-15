require 'rails_helper'

describe 'Users' do

  it 'can select a high temp and a low temp' do
    user_1 = User.create!(name: 'Emmie Hayes', email_address: 'emmie@google.com', password_digest: 'asgaesdg')
    location_1 = Location.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: 70, low_temp: 60)
    location_1 = Location.create!(nick_name: 'Denver', state: 'Colorado', high_temp: 100, low_temp: 90)
    user_1.high_pref = 70
    user_1.low_pref = 60

    visit user_path(user_1)

    select user_1.high_pref, from: :high_temperature
    select user_1.low_pref, from: :low_temperature

    expect(current_path).to eq(user_path(user_1))
    expect(page).to have_content("Boulder")
    expect(page).to_not have_content("Denver")
  end
