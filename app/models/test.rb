class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :users, through: :test_completions

  scope :tests_by_category, lambda { |name|
                              joins(:category)
                                .where(categories: { name: name })
                                .order(title: :DESC)
                                .pluck(:title)
                            }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }
end
