class User < ApplicationRecord
  def tests_by_level(level)
    ids = TestCompletion.joins('JOIN tests ON test_completions.test_id = tests.id')
                        .where(tests: { level: level }, user_id: id).pluck('test_id')
    answer = []
    ids.each { |id| answer << Test.find_by(id: id) }
    answer
  end
end
