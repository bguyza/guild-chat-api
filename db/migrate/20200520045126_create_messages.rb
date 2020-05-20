class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.string :text
      t.timestamp :sent_at
      t.integer :user_id

      t.timestamps
    end
  end
end
