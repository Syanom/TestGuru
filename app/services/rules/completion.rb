module Rules
  class Completion < AbstractBadgeRule
    def count_badge_allotments
      @tests.min do |test|
        test.test_completions.where(user: @user).count(&:successful?)
      end.test_completions.where(user: @user).count(&:successful?)
    end
  end
end
