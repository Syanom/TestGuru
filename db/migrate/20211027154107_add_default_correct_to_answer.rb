class AddDefaultCorrectToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answer, :correct, :bool, null: false, default: false
  end
end
