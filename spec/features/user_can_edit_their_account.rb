require 'rails_helper'

describe 'edit account workflow' do

  it 'submits edit form successfully' do
    user = User.create!(name: 'Emmie Hayes', email_address: 'emmie@google.com', password: 'asgaesdg')
    new_name = 'Change Name'

    visit user_path(user)
    click_on 'Edit Account'

    fill_in :name, with: new_name

    click_on 'Save changes'

    expect(current_path).to eq(user_path(user_1))
    expect(page).to have_content("Welcome Change Name!")
    expect(page).to_not have_content('Emmie Hayes')
  end
end
