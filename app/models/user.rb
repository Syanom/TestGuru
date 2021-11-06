class User < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :completed_tests, class_name: 'Test', through: :test_completions, source: :test

  def tests_by_level(level)
    Test.joins('JOIN test_completions ON test_completions.test_id = tests.id')
        .where(tests: { level: level }, test_completions: { user_id: id })
  end
end
