require 'rails_helper'

RSpec.describe 'User logout', js: true do
  let(:username) { 'enderwiggin' }
  let(:password) { 'dragonarmy' }
  let!(:user) { create(:user, username: username, password: password) }

  it 'lets a logged in user log out' do
    visit root_path

    fill_in :session_username, with: username
    fill_in :session_password, with: password

    click_on 'Log In'

    expect(page).to have_content "Welcome, #{user.display_name}!"
    expect(page).to have_button 'Sign out'

    click_on 'Sign out'

    expect(current_path).to eq root_path
  end
end
