require 'rails_helper'

describe 'visiting dashboard index page' do
  before(:each) do
    @admin = User.create!(name: 'Emmie', email_address: 'emmie@gmail.com', password: 'password', role: 1)
    @user_1 = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'password1')
    @user_2 = User.create!(name: 'Jane', email_address: 'jane@gmail.com', password: 'password2')
    @location_1 = Location.create(nick_name: 'Boulder', state: 'Colorado', high_temp: 70, low_temp: 60)
    @location_2 = Location.create(nick_name: 'Denver', state: 'Colorado', high_temp: 80, low_temp: 50)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_dashboard_index_path
  end

  context 'as an admin' do

    it 'sees all default users' do
      expect(page).to have_content('All Users')
      expect(page).to have_content("#{@user_1.email_address}")
      expect(page).to have_content("#{@user_2.email_address}")
    end

    it 'can delete a user and total number of users will decrease by 1' do

      within("#total_users") do
        expect(page).to have_content('Total Number of Users')
        expect(page).to have_content('3')
      end

      within("#user-#{@user_1.id}") do
        click_button('Delete')
      end

      expect(current_path).to eq(admin_dashboard_index_path)

      within("#total_users") do
        expect(page).to have_content('Total Number of Users')
        expect(page).to have_content('2')
      end

      expect(page).to have_content("#{@user_2.email_address}")
      expect(page).to_not have_content("#{@user_1.email_address}")
    end

    it 'sees all locations' do
      expect(page).to have_content('All Locations')
      expect(page).to have_content("#{@location_1.nick_name}")
      expect(page).to have_content("#{@location_1.state}")
      expect(page).to have_content("#{@location_2.nick_name}")
      expect(page).to have_content("#{@location_2.state}")
    end

    it 'can delete a location and total number of loations will decrease by 1' do

      within("#total_locations") do
        expect(page).to have_content('Total Number of Locations')
        expect(page).to have_content('2')
      end

      within("#location-#{@location_1.id}") do
        click_button('Delete')
      end

      expect(current_path).to eq(admin_dashboard_index_path)

      within("#total_locations") do
        expect(page).to have_content('Total Number of Locations')
        expect(page).to have_content('1')
      end

      expect(page).to_not have_content("#{@location_1.nick_name}")
      expect(page).to have_content("#{@location_2.nick_name}")
    end
  end
end

describe 'as default user visiting the admin dashboard page' do
  context 'only admin should be able to see admin dashboard page' do
    it 'recieves 404 message' do
      user_1 = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'password1')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit admin_dashboard_index_path

      expect(page).to_not have_content('All Users')
      expect(page).to_not have_content('All Locations')
      expect(page).to_not have_content('Total Number of Users: 2')
      expect(page).to have_content('The page you were looking for doesn\'t exist')
    end
  end
end

describe 'as visitor visiting the admin dashboard page' do
  context 'only admin should be able to see admin dashboard page' do
    it 'recieves 404 message' do

      visit admin_dashboard_index_path

      expect(page).to_not have_content('All Users')
      expect(page).to_not have_content('All Locations')
      expect(page).to_not have_content('Total Number of Users: 2')
      expect(page).to have_content('The page you were looking for doesn\'t exist')
    end
  end
end
