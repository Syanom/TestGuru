class AddTimerRelativeFields < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :time
    add_column :test_completions, :deadline, :datetime
  end
end
