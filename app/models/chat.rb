class Chat < ApplicationRecord
    has_many :user_chats
    has_many :messages
end
