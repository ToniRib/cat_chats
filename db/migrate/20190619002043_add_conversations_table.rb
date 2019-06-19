class AddConversationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :sender, foreign_key: { to_table: :users }, null: false
      t.references :receiver, foreign_key: { to_table: :users }, null: false
      t.timestamps null: false
    end
  end
end
