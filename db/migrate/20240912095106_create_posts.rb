class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.boolean :published, null: false

      t.timestamps
    end
  end
end
