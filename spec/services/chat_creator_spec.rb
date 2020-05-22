require 'rails_helper'

describe ChatCreator do
  let!(:user1) { create(:user, name: 'Lucas') }
  let!(:user2) { create(:user, name: 'Jesse') }

  it 'creates a new chat' do
    chat = ChatCreator.call([user1.id, user2.id], 'My test chat')
    expect(chat).to_not be_nil
    expect(UserChat.where(chat_id: chat.id).count).to eq(2)
  end
end