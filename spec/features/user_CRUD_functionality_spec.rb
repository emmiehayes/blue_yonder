require 'rails_helper'

describe 'Users' do

  xit 'can create a new account by filling out a form' do
    name = 'Emmie'
    email_address = 'emmie@google.com'
    password = '777'

    visit signup_path

    fill_in :Name, with: name
    fill_in :Email, with: email_address
    fill_in :Password, with: password
    fill_in :Password_confirmation, with: password

    click_on 'Sign Up'

    expect(current_path).to eq(user_path(1))
    expect(page).to have_content("Welcome #{name}!")
    expect(page).to have_content('Edit Account')
    expect(page).to have_content('Logout')
    expect(page).to have_content('Home')
    expect(page).to have_content('Favorites')
  end

  it 'can edit their account by updating a form' do
    user_1 = User.create!(name: 'Emmie Hayes', email_address: 'emmie@google.com', password_digest: 'asgaesdg')
    new_name = 'New Name'

    visit user_path(user_1)
    click_on 'Edit Account'

    fill_in :Name, with: new_name

    click_on 'Save changes'

    expect(current_path).to eq(user_path(user_1))
    expect(page).to have_content(new_name)
    expect(page).to_not have_content('Emmie Hayes')
  end

  it 'can logout' do
    user_1 = User.create!(name: 'Emmie Hayes', email_address: 'emmie@google.com', password_digest: 'asgaesdg')

    visit user_path(user_1)

    click_on 'Logout'

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content(user_1.name)
    expect(page).to_not have_content(user_1.email_address)
  end
end
