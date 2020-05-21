class CreateUserChats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_chats do |t|
      t.integer :chat_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
