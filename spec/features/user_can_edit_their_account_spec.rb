require 'rails_helper'

describe 'edit account workflow' do

  it 'submits edit form successfully' do
    user = User.create!(name: 'Emmie', email_address: 'emmie@google.com', password: 'asgaesdg', high_pref: 0, low_pref: 0)
    new_name = 'Change'

    visit user_path(user)
    click_on 'Edit Account'
    fill_in 'user[name]', with: new_name
    click_on 'Update'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome Change!")
    expect(page).to_not have_content('Emmie')
  end
end
