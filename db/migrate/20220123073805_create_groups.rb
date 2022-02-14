class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :badge, null: false
      t.string :type, presence: true
      t.string :value, presence: true

      t.timestamps
    end
  end
end
