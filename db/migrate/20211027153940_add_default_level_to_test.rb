class AddDefaultLevelToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :test, :level, :integer, null: false, default: 0
  end
end
