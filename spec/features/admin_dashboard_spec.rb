require 'rails_helper'

describe 'admin visits dashboard index page' do

  before(:each) do
    @admin = User.create!(name: 'Emmie', email_address: 'emmie@gmail.com', password: 'password', role: 1)
    @user = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'password')
  end

  context 'as admin' do
    it 'allows admin to see all users and app analysis' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_dashboard_index_path
      expect(page).to have_content('All Users')
      expect(page).to have_content('Total Number of Users: 2')
      expect(page).to have_content("Last User Registered On: #{@user.created_at}")
    end

    it 'can delete a default user' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_dashboard_index_path
      click_button 'Delete User'
      expect(page).to_not have_content("#{@user.name}")
      expect(page).to_not have_content("#{@user.email_address}")
    end
  end
end

describe 'user visits admin dashboard index page' do
  context 'as default user' do
    it 'does not allow default user to see admin dashboard index' do
      user = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'password')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_index_path
      expect(page).to_not have_content('All Users')
      expect(page).to have_content('The page you were looking for doesn\'t exist')
    end
  end
end
