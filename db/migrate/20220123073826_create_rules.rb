class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.references :badge, null: false
      t.string :rule_type, presence: true
      t.string :rule_value, presence: true

      t.timestamps
    end
  end
end
