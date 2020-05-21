class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  has_many :user_chats, through: :chat

  validate :user_is_part_of_chat
  validates :user, presence: true
  validates :chat, presence: true

  def self.recent_messages(sender_id, recipient_id, last_30_days = false)
    if last_30_days
      Message.where('user_id = ? AND created_at > ?', sender_id, 30.days.ago)
             .joins(:user_chats).where(user_chats: { user_id: recipient_id })
             .order('created_at DESC')
    else
      Message.where(user_id: sender_id)
             .joins(:user_chats).where(user_chats: { user_id: recipient_id })
             .order('created_at DESC')
             .limit(100)
    end
  end

  def self.all_recent_messages(last_30_days = false)
    if last_30_days
      Message.where('created_at > ?', 30.days.ago)
             .order('created_at DESC')
    else
      Message.all.order('created_at DESC').limit(100)
    end
  end

  private

  def user_is_part_of_chat
    return if user_chats.pluck(:id).include?(user_id)

    errors.add('User must belong to the chat')
  end
end
