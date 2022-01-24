class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.references :badge, null: false
      t.integer :attempts
      t.time :completion_time
      t.boolean :completion

      t.timestamps
    end
  end
end
