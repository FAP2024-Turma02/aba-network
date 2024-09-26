class CreateCompanyDomains < ActiveRecord::Migration[7.0]
  def change
    create_table :company_domains do |t|
      t.integer :company_id, null: false, foreign_key: true
      t.integer :domain_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
