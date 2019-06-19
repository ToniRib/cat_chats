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

  describe 'GET #show' do
    let(:user) { create(:user, username: 'enderwiggin', password: 'dragonarmy') }
    let(:conversation) { create(:conversation, sender: user) }
    let!(:first_message) do
      create(:message, conversation: conversation, user: conversation.sender, body: 'hello!', created_at: 2.days.ago)
    end
    let!(:second_message) do
      create(:message, conversation: conversation, user: conversation.receiver, body: 'hi there!', created_at: 1.day.ago)
    end

    context 'when user is logged in' do
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return user
      end

      context 'and conversation exists' do
        context 'and belongs to user' do
          it 'returns a 200' do
            get :show, params: { format: :json, id: conversation.id }

            expect(response.status).to eq 200
          end

          it 'returns displayable messages' do
            get :show, params: { format: :json, id: conversation.id }

            expect(JSON.parse(response.body, symbolize_names: true)).to match({
              messages: [
                a_hash_including(id: first_message.id),
                a_hash_including(id: second_message.id),
              ]
            })
          end
        end

        context 'and does not belong to user' do
          it 'returns a 404' do
            other_conversation = create(:conversation)

            get :show, params: { format: :json, id: other_conversation.id }

            expect(response.status).to eq 404
          end
        end
      end
    end

    context 'when user not logged in' do
      it 'returns a 404' do
        get :show, params: { format: :json, id: conversation.id }

        expect(response.status).to eq 404
      end
    end
  end
end
