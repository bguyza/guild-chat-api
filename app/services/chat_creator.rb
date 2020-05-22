# Service class that creates a new chat and associates participant users to
# to the chat via UserChats
class ChatCreator
  def self.call(*args, &block)
    new(*args, &block).execute
  end

  def initialize(user_ids, name)
    @user_ids = user_ids
    @name = name
  end

  def execute
    chat = nil
    begin
      ActiveRecord::Base.transaction do
        chat = Chat.create!(name: @name)
        @user_ids.each { |user_id| UserChat.create!(user_id: user_id, chat_id: chat.id) }
      end
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Unable to create chat: #{e.message}")
    end
    chat
  end
end