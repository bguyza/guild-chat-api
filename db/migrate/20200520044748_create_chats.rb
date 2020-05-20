class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.integer :user_chat_id
      t.string :name

      t.timestamps
    end
  end
end
