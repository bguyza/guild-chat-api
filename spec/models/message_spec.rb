require 'rails_helper'

RSpec.describe Message, type: :model do
  let!(:chat) { create(:chat) }
  let!(:user) { create(:user) }
  let!(:user2) { create(:user, name: 'Val') }
  let!(:user_chat) { create(:user_chat, user_id: user.id, chat_id: chat.id) }

  it 'is valid with valid attributes' do
    expect(Message.new(chat: chat, user: user)).to be_valid
  end

  it 'is not valid without a user' do
    expect(Message.new(chat: chat)).to_not be_valid
  end

  it 'is not valid without a chat' do
    expect(Message.new(user: user)).to_not be_valid
  end

  it 'is not valid if user does not belong to associated chat' do
    expect(Message.new(chat: chat, user: user2)).to_not be_valid
  end
end
