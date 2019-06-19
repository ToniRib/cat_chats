require 'rails_helper'

RSpec.describe 'User login', js: true do
  let(:username) { 'enderwiggin' }
  let(:password) { 'dragonarmy' }

  context 'when user exists' do
    let!(:user) { create(:user, username: username, password: password) }

    context 'and password is correct' do
      it 'logs the user in' do
        visit root_path

        fill_in :session_username, with: username
        fill_in :session_password, with: password

        click_on 'Log In'

        expect(page).to have_content "Welcome, #{user.display_name}!"
      end
    end

    context 'and password is incorrect' do
      it 'displays an error message' do
        visit root_path

        fill_in :session_username, with: username
        fill_in :session_password, with: 'bad password'

        click_on 'Log In'

        expect(page).to have_content 'Invalid login credentials. Please try again.'
      end
    end
  end

  context 'when user does not exist' do
    it 'displays an error message' do
      visit root_path

      fill_in :session_username, with: username
      fill_in :session_password, with: password

      click_on 'Log In'

      expect(page).to have_content 'Invalid login credentials. Please try again.'
    end
  end
end
