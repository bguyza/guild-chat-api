class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chats_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(params)
    params = params['params']
    message = Message.create!(user_id: params['user_id'], chat_id: params['chat_id'], text: params['text'])
    ActionCable.server.broadcast('chats_channel', user: message.user.name, text: message.text)
  end
end
