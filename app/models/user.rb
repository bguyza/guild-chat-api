class User < ApplicationRecord
  has_many :messages
  has_many :user_chats
  has_many :chats, through: :user_chats

  validates :name, presence: true, uniqueness: true
end
