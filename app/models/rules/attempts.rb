class Attempts < Rule
  def count_badges_to_assign(user)
    result = 1
    badge.tests.each do |test|
      failed_attempts = 0
      successful = false
      test_completions = test.test_completions.where(user: user)
      test_completions.each do |test_completion|
        failed_attempts += 1 unless test_completion.successful?
        successful = true if test_completion.successful?
      end
      result = 0 if failed_attempts >= attempts || test_completions.empty? || !successful
    end
    result
  end
end
