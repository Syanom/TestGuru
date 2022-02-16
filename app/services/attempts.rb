class Attempts < AbstractBadgeRule
  def count_badge_allotments
    result = 1
    @badge.tests.each do |test|
      test_completions = test.test_completions.where(user: @user)
      failures = test_completions.count { |test_completion| !test_completion.successful? }
      if failures >= @badge.rule_value.to_i || test_completions.empty? || test_completions.none?(&:successful?)
        result = 0
      end
    end
    result
  end
end
