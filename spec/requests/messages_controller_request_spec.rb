require 'rails_helper'

RSpec.describe 'MessagesControllers', type: :request do
  let!(:chat) { create(:chat) }
  let!(:user) { create(:user) }
  let!(:user2) { create(:user, name: 'User 2') }
  let!(:user_chat) { create(:user_chat, chat: chat, user_id: user.id) }
  let!(:user_chat2) { create(:user_chat, chat: chat, user_id: user2.id) }

  describe 'GET /MessagesController' do
    it 'returns http success' do
      get '/messages'
      expect(response).to have_http_status(:success)
    end

    context 'with last 30 days set to true for recent messages' do
      it 'returns http success' do
        get "/messages/recent_for_user",
            params: {
              sender_id: user.id,
              recipient_id: user2.id,
              last30: true
            }
        expect(response).to have_http_status(:success)
      end

      it 'returns http success' do
        get "/messages/recent_all",
            params: { last30: true }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /MessagesController' do
    it 'returns http success' do
      post '/messages',
           params: {
             message: {
               user_id: user.id,
               chat_id: chat.id,
               text: "Hello what's going on friends!"
             }
           }.to_json,
           headers: { 'CONTENT_TYPE': 'application/json' }

      expect(response).to have_http_status(:success)
    end

    it 'returns http failure with unknown user id' do
      post '/messages',
           params: {
             message: {
               user_id: 333,
               chat_id: chat.id,
               text: "Hello what's going on friends!"
             }
           }.to_json,
           headers: { 'CONTENT_TYPE': 'application/json' }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns http failure with invalid chat id' do
      post '/messages',
           params: {
             message: {
               user_id: user.id,
               chat_id: 9999,
               text: "Hello what's going on friends!"
             }
           }.to_json,
           headers: { 'CONTENT_TYPE': 'application/json' }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
