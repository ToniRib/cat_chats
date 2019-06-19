require 'rails_helper'

describe User do
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
end
