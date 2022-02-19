class CreateBadgeAllotments < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_allotments do |t|
      t.references :badge, null: false
      t.references :user, null: false
      t.integer :number_of_badges, default: 0

      t.timestamps
    end
  end
end
