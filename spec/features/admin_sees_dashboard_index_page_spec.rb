require 'rails_helper'

describe 'user visits dashboard index page' do
  context 'as admin' do
    it 'allows admin to see all users' do
      admin = User.create!(name: 'Emmie', email_address: 'emmie@gmail.com', password: 'password', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path
      expect(page).to have_content('All Users')
    end
  end

  context 'as a default user' do
    it 'does not allow default user to see admin dashboard index' do
      user = User.create!(name: 'Bob', email_address: 'bob@gmail.com', password: 'password')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_index_path

      expect(page).to_not have_content('All Users')
      expect(page).to have_content('The page you were looking for doesn\'t exist')
    end
  end
end
