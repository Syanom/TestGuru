class ExcludeNullFields < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, column_options: { null: false }
    create_join_table :users, column_options: { null: false }
    create_join_table :questions, column_options: { null: false }
    create_join_table :answers, column_options: { null: false }
    create_join_table :tests, column_options: { null: false }
  end
end
