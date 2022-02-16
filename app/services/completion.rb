class Completion < AbstractBadgeRule
  def count_badge_allotments
    @badge.tests.min do |test|
      test.test_completions.where(user: @user).count(&:successful?)
    end.test_completions.where(user: @user).count(&:successful?)
  end
end
