class Completion < Rule
  def count_badges_to_assign(user)
    result = Array.new(badge.tests.length, 0)
    i = 0
    badge.tests.each do |test|
      test.test_completions.where(user: user).each do |test_completion|
        result[i] += 1 if test_completion.successful?
      end
      i += 1
    end
    result.min
  end
end
