class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :users, through: :test_completions

  validates :title, presence: true
  validates :level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates_uniqueness_of :title, scope: :level
  validates :timer_hours, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :timer_minutes, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :timer_seconds, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  scope :tests_by_category, lambda { |name|
                              joins(:category)
                                .where(categories: { name: name })
                                .order(title: :DESC)
                            }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }

  def test_titles_by_category(name)
    tests_by_category(name).pluck(:title)
  end
end
