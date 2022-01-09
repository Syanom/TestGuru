class AddTimerRelativeFields < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer_hours, :int, null: false, default: 0
    add_column :tests, :timer_minutes, :int, null: false, default: 0
    add_column :tests, :timer_seconds, :int, null: false, default: 0
    add_column :test_completions, :deadline, :datetime
  end
end
