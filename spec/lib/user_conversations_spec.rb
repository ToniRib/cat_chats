require 'rails_helper'

RSpec.describe UserConversations do
  context '.for' do
    let!(:eliot) { create(:user, first_name: 'Eliot', last_name: 'Waugh', username: 'eliot') }
    let!(:janet) { create(:user, first_name: 'Janet', last_name: 'Way', username: 'janet' ) }

    context 'when user is the sender' do
      let!(:conversation) { create(:conversation, sender: janet, receiver: eliot) }

      it 'includes conversation' do
        expect(described_class.for(janet)).to include a_hash_including(id: conversation.id)
      end

      it 'sets displayName to receiver username' do
        expect(described_class.for(janet).first[:displayName]).to eq 'Eliot Waugh'
      end
    end

    context 'when user is the receiver' do
      let!(:conversation) { create(:conversation, sender: eliot, receiver: janet) }

      it 'includes conversation' do
        expect(described_class.for(janet)).to include a_hash_including(id: conversation.id)
      end

      it 'sets displayName to sender username' do
        expect(described_class.for(janet).first[:displayName]).to eq 'Eliot Waugh'
      end
    end

    context 'when user is neither sender nor receiver' do
      it 'excludes conversation' do
        create(:conversation, sender: eliot, receiver: create(:user))

        expect(described_class.for(janet)).to be_empty
      end
    end
  end
end
