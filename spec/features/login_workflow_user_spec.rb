require 'rails_helper'

describe 'user login workflow' do
  it 'allows registered users to log in successfully' do
    user = User.create!(name: 'Emmie', email_address: 'emmie@google.com', password: 'asgaesdg', high_pref: 0, low_pref: 0)

    visit '/'

    click_on 'Log In'
    expect(current_path).to eq(login_path)

    fill_in :email_address, with: user.email_address
    fill_in :password, with: user.password
    click_on 'Log In'
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('Log Out')
    expect(page).to_not have_content('Sign In')

    click_on 'Log Out'
    expect(current_path).to eq(root_path)
  end
end
