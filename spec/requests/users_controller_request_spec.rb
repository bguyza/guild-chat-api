require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  let!(:user1) { create(:user, name: 'Jocko Willink') }
  let!(:user2) { create(:user, name: 'Renzo Gracie') }
  let!(:user3) { create(:user, name: 'Xiong Jignan') }

  describe 'GET /UsersController' do
    it 'returns http success for all users' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end

    it 'returns http success for a single user' do
      get "/users/#{user2.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(user2.id)
    end

    it 'returns not found when user not found' do
      get '/users/999'
      expect(response).to have_http_status(:not_found)
    end
  end
end
