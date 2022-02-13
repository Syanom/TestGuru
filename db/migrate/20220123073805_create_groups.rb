class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :badge, null: false
      t.string :group_type, presence: true
      t.string :group_value, presence: true

      t.timestamps
    end
  end
end
