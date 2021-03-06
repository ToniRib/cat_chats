require 'rails_helper'

RSpec.describe DisplayableMessages do
  let(:conversation) { create(:conversation) }
  let!(:first_message) do
    create(:message, conversation: conversation, user: conversation.sender, body: 'hello!', created_at: 2.days.ago)
  end
  let!(:second_message) do
    create(:message, conversation: conversation, user: conversation.receiver, body: 'hi there!', created_at: 1.day.ago)
  end
  let!(:other_message) { create(:message, user: conversation.sender, body: 'unrelated') }

  describe '#for_conversation' do
    it 'returns messages for the given conversation' do
      expect(subject.for_conversation(conversation)).to contain_exactly(
        a_hash_including(id: second_message.id),
        a_hash_including(id: first_message.id),
      )
    end

    it 'returns messages in order of created_at' do
      expect(subject.for_conversation(conversation)).to match([
        a_hash_including(id: first_message.id),
        a_hash_including(id: second_message.id),
      ])
    end

    it 'returns messages in a presentable format' do
      expect(subject.for_conversation(conversation).first).to match({
        id: first_message.id,
        displayName: first_message.user.display_name,
        body: first_message.body,
        timeSent: anything,
      })
    end
  end

  describe '#single_message' do
    it 'returns a single message in a presentable format' do
      expect(subject.single_message(first_message)).to match({
        id: first_message.id,
        displayName: first_message.user.display_name,
        body: first_message.body,
        timeSent: anything,
      })
    end
  end
end
