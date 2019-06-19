require 'rails_helper'

RSpec.describe ConversationsController do
  describe 'GET #index' do
    context 'when user is logged in' do
      let!(:user) { create(:user, username: 'enderwiggin', password: 'dragonarmy') }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return user
      end

      it 'returns a 200' do
        get :index

        expect(response.status).to eq 200
      end
    end

    context 'when user not logged in' do
      it 'returns a 404' do
        get :index

        expect(response.status).to eq 404
      end
    end
  end
end
