class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :authored_feedbacks, class_name: 'Feedback', foreign_key: 'author_id', dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :tests, through: :test_completions, source: :test

  def tests_by_level(level)
    completed_tests.level(level)
  end

  def test_completion(test)
    test_completions.order(created_at: :desc).find_by(test_id: test.id)
  end
end
