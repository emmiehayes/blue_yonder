require 'rails_helper'

describe 'admin login workflow' do
  it 'allows registered admin to log in successfully' do
    admin = User.create!(name: 'Emmie', email_address: 'peace@gmail.com', password: 'password', role: 1)

    visit '/'

    click_on 'Log In'
    expect(current_path).to eq(login_path)

    fill_in :email_address, with: admin.email_address
    fill_in :password, with: admin.password
    click_on 'Log In'
    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content('Log Out')
    expect(page).to_not have_content('Log In')

    click_on 'Log Out'
    expect(current_path).to eq(root_path)
  end
end
