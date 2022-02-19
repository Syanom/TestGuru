module Rules
  class CompletionTime < AbstractBadgeRule
    def count_badge_allotments
      result = Array.new(@tests.length, 0)
      completion_time = @badge.rule_value.to_time
      completion_time_in_sec = completion_time.hour * 3600 + completion_time.min * 60 + completion_time.sec
      # Вот тут each_with_index был очень полезен
      @tests.each_with_index do |test, index|
        test.test_completions.where(user: @user).each do |test_completion|
          result[index] += 1 if test_completion.successful? && test_completion.completion_time <= completion_time_in_sec
        end
      end
      result.min
    end
  end
end
