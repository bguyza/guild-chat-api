class UserChat < ApplicationRecord
    belongs_to :chat
    has_many :users
end
