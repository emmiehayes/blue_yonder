require 'rails_helper'

describe 'visiting dashboard index page' do
 before(:each) do
       @admin = User.create!(name: 'Emmie', email_address: 'emmie@gmail.com', password: 'password', role: 1)
       @user = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'password')
       @location = Location.create!(nick_name: 'Boulder', state: 'Colorado', high_temp: 70, low_temp: 60)
     end

  context 'as admin' do
    it 'sees all default users' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_index_path
      expect(page).to have_content('All Users')
      expect(page).to have_content("#{@user.name}")
      expect(page).to have_content("#{@user.email_address}")
    end

    it 'deletes a default user' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_index_path
      click_button 'Delete User'
      expect(page).to_not have_content("#{@user.name}")
      expect(page).to_not have_content("#{@user.email_address}")
    end

    it 'sees admin analysis' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_index_path
      expect(page).to have_content('Total Number of Users: 2')
      expect(page).to have_content("Last User Registered On: #{@user.created_at}")
    end

    it 'sees all locations' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_index_path
      expect(page).to have_content('All Locations')
      expect(page).to have_content("#{@location.nick_name}")
      expect(page).to have_content("#{@location.state}")
    end

    it 'deletes a location' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_index_path
      click_button 'Delete Location'
      expect(page).to_not have_content("#{@location.nick_name}")
      expect(page).to_not have_content("#{@location.state}")
    end
  end
end

describe 'as default user visiting the dashboard page' do
  context 'i will not see the dashboard page' do
    it 'does not see analysis' do
      user = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'password')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_dashboard_index_path
      expect(page).to_not have_content('All Users')
      expect(page).to_not have_content('All Locations')
      expect(page).to_not have_content('Total Number of Users: 2')
      expect(page).to_not have_content("Last User Registered On: #{user.created_at}")
      expect(page).to have_content('The page you were looking for doesn\'t exist')
    end
  end
end
