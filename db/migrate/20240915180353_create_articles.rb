class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :domain_url
      t.integer :company_id

      t.timestamps
    end
  end
end
