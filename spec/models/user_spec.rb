require 'rails_helper'

RSpec.describe User do
  context 'when username has been taken' do
    let(:username) { 'jamesholden' }
    let(:copycat_user) do
      described_class.new(
        first_name: 'Amos',
        last_name: 'Burton',
        username: username,
        password: 'detroit',
      )
    end

    before do
      described_class.create!(
        first_name: 'James',
        last_name: 'Holden',
        username: username,
        password: 'rocinante',
      )
    end

    it 'is invalid' do
      expect(copycat_user).not_to be_valid
    end

    it 'raises an appropriate error on save' do
      expect { copycat_user.save! }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  context 'when all required fields provided' do
    it 'is valid' do
      user = described_class.new(
        first_name: 'Naomi',
        last_name: 'Nagata',
        username: 'naominagata',
        password: 'opa',
        password_confirmation: 'opa',
      )

      expect(user).to be_valid
    end
  end

  describe '#display_name' do
    it 'returns the first and last name' do
      user = create(:user, first_name: 'Julia', last_name: 'Wicker')

      expect(user.display_name).to eq 'Julia Wicker'
    end
  end

  describe '#all_conversations' do
    let(:eliot) { create(:user, username: 'eliot') }

    subject { create(:user, username: 'janet' ) }

    context 'when user is the sender' do
      it 'includes conversation' do
        conversation = create(:conversation, sender: subject, receiver: eliot)

        expect(subject.all_conversations).to include conversation
      end
    end

    context 'when user is the receiver' do
      it 'includes conversation' do
        conversation = create(:conversation, sender: eliot, receiver: subject)

        expect(subject.all_conversations).to include conversation
      end
    end

    context 'when user is neither sender nor receiver' do
      it 'excludes conversation' do
        conversation = create(:conversation, sender: eliot, receiver: create(:user))

        expect(subject.all_conversations).not_to include conversation
      end
    end
  end
end
