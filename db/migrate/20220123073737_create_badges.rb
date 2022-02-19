class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :group_type, null: false
      t.string :group_value, null: false
      t.integer :rule_type, null: false
      t.string :rule_value, null: false

      t.timestamps
    end
  end
end
