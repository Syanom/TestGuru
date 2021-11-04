class Test < ApplicationRecord
  has_many :questions
  has_many :test_completions
  has_many :users, through: :test_completions
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.tests_by_category(category_name)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { name: category_name })
      .order(title: :DESC)
      .pluck(:title)
  end
end
