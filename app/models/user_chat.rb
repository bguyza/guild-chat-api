class UserChat < ApplicationRecord
  belongs_to :chat
  has_many :users
  has_many :messages, through: :chat

  validates_associated :chat
  validates_associated :users
  validates :chat_id, uniqueness: { scope: :user_id }
end
