class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.references :record, polymorphic: true, index: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
