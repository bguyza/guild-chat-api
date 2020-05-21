class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :chat_id, null: false
      t.integer :user_id, null: false
      t.string :text

      t.timestamps
    end
  end
end
