class ExcludeNullFields < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :users, :questions, :answers, :tests, column_options: { null: true }
  end
end
