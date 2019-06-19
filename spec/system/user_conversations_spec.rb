require 'rails_helper'

RSpec.describe 'User Conversations', js: true do
  let(:holden) do
    create(:user, first_name: 'James', last_name: 'Holden', username: 'jamesholden')
  end
  let(:naomi) do
    create(:user, first_name: 'Naomi', last_name: 'Nagata', username: 'naominagata')
  end
  let(:amos) do
    create(:user, first_name: 'Amos', last_name: 'Burton', username: 'amosburton')
  end
  let(:alex) do
    create(:user, first_name: 'Alex', last_name: 'Kamal', username: 'alexkamal')
  end
  let!(:convo_holden_with_naomi) { create(:conversation, sender: holden, receiver: naomi) }
  let!(:convo_amos_with_holden) { create(:conversation, sender: amos, receiver: holden) }
  let!(:convo_amos_with_alex) { create(:conversation, sender: amos, receiver: alex) }
  let!(:message_to_naomi) { create(:message, user: holden, conversation: convo_holden_with_naomi, body: 'Hi, there XO!')}
  let!(:message_from_naomi) { create(:message, user: naomi, conversation: convo_holden_with_naomi, body: 'Hey, captain!')}

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return holden
  end

  it 'displays a list of conversations the user is involved in' do
    visit conversations_path

    within '#conversation-list' do
      expect(page).to have_content 'Active Conversations'
      expect(page).to have_content 'Naomi Nagata'
      expect(page).to have_content 'Amos Burton'
      expect(page).not_to have_content 'Alex Kamal'
    end
  end

  it 'allows the user to select a conversation' do
    visit conversations_path

    within '#conversation-list' do
      find("#conversation-#{convo_holden_with_naomi.id}").click
    end

    within '#active-conversation' do
      expect(page).to have_content 'Hi, there XO!'
      expect(page).to have_content 'Hey, captain!'
    end
  end
end
