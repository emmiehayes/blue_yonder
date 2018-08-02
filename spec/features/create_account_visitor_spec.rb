require 'rails_helper'

describe 'registration workflow' do

  it 'submits registration succesfully' do

    name = 'rob'
    email_address = 'rspec@google.com'
    password = 'password'

    visit '/'
    click_on 'Log In'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[name]', with: name
    fill_in 'user[email_address]', with: email_address
    fill_in 'user[password]', with: password
    click_on 'Create User'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome #{User.last.name}!")
  end

  it 'denies registration with duplicate email_address' do

    user = User.create!(name: 'Emmie', email_address: 'emmie@google.com', password: 'asgaesdg', high_pref: 0, low_pref: 0)
    count = User.count

    name = 'emily'
    email_address = 'emmie@google.com'
    password = 'password12'

    visit '/'
    click_on 'Create Account'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[name]', with: name
    fill_in 'user[email_address]', with: email_address
    fill_in 'user[password]', with: password

    click_on 'Create User'

    expect(current_path).to eq(users_path)
    expect(User.count).to eq(count)
  end
end
