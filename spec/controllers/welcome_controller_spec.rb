require 'rails_helper'

RSpec.describe WelcomeController do
  describe 'GET #index' do
    it 'returns 200' do
      get :index

      expect(response.status).to eq 200
    end
  end
end
