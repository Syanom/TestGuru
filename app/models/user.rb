class User < ApplicationRecord
  include Auth

  has_many :authored_tests, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :tests, through: :test_completions, source: :test

  has_secure_password

  def tests_by_level(level)
    completed_tests.level(level)
  end

  def test_completion(test)
    test_completions.order(created_at: :desc).find_by(test_id: test.id)
  end
end
