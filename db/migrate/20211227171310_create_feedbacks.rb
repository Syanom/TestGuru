class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :content
      t.timestamps
    end
  end
end
