class CompletionTime < Rule
  def count_badges_to_assign(user)
    result = Array.new(badge.tests.length, 0)
    completion_time = value.to_time
    completion_time_in_sec = completion_time.hour * 3600 + completion_time.min * 60 + completion_time.sec
    i = 0
    badge.tests.each do |test|
      test.test_completions.where(user: user).each do |test_completion|
        result[i] += 1 if test_completion.successful? && test_completion.completion_time <= completion_time_in_sec
      end
      i += 1
    end
    result.min
  end
end
