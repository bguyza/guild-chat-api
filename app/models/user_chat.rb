class UserChat < ApplicationRecord
  belongs_to :chat
  has_many :users
  has_many :messages, through: :chat

  validates :chat, presence: true
end
