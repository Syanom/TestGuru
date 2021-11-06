class User < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :completed_tests, class_name: 'Test', through: :test_completions, source: :test

  validates :name, presence: true
  validates :email, presence: true

  def tests_by_level(level)
    completed_tests.level(level)
  end
end
