class CreatePostUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :post_users do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :owner_boolean

      t.timestamps
    end
    add_index :post_users, [:user_id, :post_id], unique: true
  end
end
