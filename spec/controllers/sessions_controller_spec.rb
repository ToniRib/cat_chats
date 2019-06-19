require 'rails_helper'

RSpec.describe SessionsController do
  describe 'POST #create' do
    context 'when user exists' do
      let!(:user) { create(:user, username: 'enderwiggin', password: 'dragonarmy') }

      context 'and authenticates successfully' do
        it 'redirects to the conversation dashboard' do
          post :create, params: { session: { username: user.username, password: user.password } }

          expect(response).to redirect_to conversations_path
        end
      end

      context 'and authentication fails' do
        it 'redirects to root' do
          post :create, params: { session: { username: user.username, password: 'pineapple' } }

          expect(response).to redirect_to root_path
        end
      end
    end

    context 'when user does not exist' do
      it 'redirects to root' do
        post :create, params: { session: { username: 'notarealuser', password: 'pineapple' } }

        expect(response).to redirect_to root_path
      end
    end
  end
end
