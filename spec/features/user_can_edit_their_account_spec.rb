require 'rails_helper'

describe 'edit account workflow' do

  it 'submits edit form successfully' do
    user = User.create!(name: 'Emmie', email_address: 'emmie@google.com', password: 'asgaesdg', high_pref: 0, low_pref: 0)
    new_name = 'Emily'

    visit user_path(user)

    click_on 'Edit Account'

    expect(current_path).to eq(edit_user_path(user))

    fill_in 'user[name]', with: new_name
    click_button 'Update'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Emily's Favorite Spots")
    expect(page).to_not have_content('Emmie')
  end
end
