require 'rails_helper'

describe 'registration workflow' do

  it 'submits registration succesfully' do

    name = 'test'
    email_address = 'test@gmail.com'
    password = 'password'

    visit '/'

    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)
    fill_in 'user[name]', with: name
    fill_in 'user[email_address]', with: email_address
    fill_in 'user[password]', with: password

    click_on 'Create User'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome #{User.last.name}!")
  end

  it 'submits registration with duplicate email_address' do
    email_address = 'test@gmail.com'
    user = User.create!(name: 'test', email_address: 'test@gmail.com', password: 'askdgjae')
    count = User.count  #THIS TEST THAT THE FORM IS BEHAVING CORRECTLY

    visit '/'

    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email_address]', with: email_address
    fill_in 'user[password]', with: '12345'

    click_on 'Create User'
    expect(current_path).to eq(users_path)
    expect(User.count).to eq(count)
  end
end
