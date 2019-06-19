class AddMessagesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true, null: false
      t.references :conversation, foreign_key: true, null: false
      t.string :body, null: false
      t.timestamps null: false
    end
  end
end
