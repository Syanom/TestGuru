class AddTimerRelativeFields < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :int, null: false, default: 0
    add_column :test_completions, :deadline, :datetime
  end
end
