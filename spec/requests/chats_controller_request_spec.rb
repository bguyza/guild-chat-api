require 'rails_helper'

RSpec.describe 'ChatsControllers', type: :request do
  let!(:chat) { create(:chat) }

  describe 'GET /ChatsController' do
    it 'returns http success' do
      get '/chats'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end

    it 'returns http success for single chat' do
      get "/chats/#{chat.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(chat.id)
    end

    it 'returns not found when chat not found' do
      get '/chats/999'
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /ChatsController' do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user, name: 'Deborah Birx') }
    it 'returns http success' do
      post '/chats',
           params: {
             chat: {
               name: 'Super Dooper Cool Chat',
               user_ids: [user1.id, user2.id]
             }
            }.to_json,
        headers: { 'CONTENT_TYPE': 'application/json' }

      expect(response).to have_http_status(:success)
    end
  end
end
