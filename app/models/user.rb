class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN test_completions ON test_completions.test_id = tests.id')
        .where(tests: { level: level }, test_completions: { user_id: id })
  end
end
