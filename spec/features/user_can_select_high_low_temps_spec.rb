require 'rails_helper'

describe 'Users' do

  it 'can select a high temp and a low temp' do
    user_1 = User.create!(name: 'Emmie Hayes', email_address: 'emmie@google.com', password_digest: 'asgaesdg')
    user.high_pref = 70
    user.low_pref = 60
    visit user_path(user_1)

    select user.high_pref, from: :high_temperature
    select user.low_pref, from: :low_temperature

    expect(current_path).to eq(user_path(1))
    expect(page).to have_content("Denver")
    expect(page).to_not have_content("Boulder")
  end
