class CreateTestCompletions < ActiveRecord::Migration[6.1]
  def change
    create_table :test_completions do |t|

      t.timestamps
    end
  end
end
