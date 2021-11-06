class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :users, through: :test_completions

  def self.tests_by_category(category_name)
    joins(:category)
      .where(categories: { name: category_name })
      .order(title: :DESC)
      .pluck(:title)
  end

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
end
