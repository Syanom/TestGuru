class BadgeGroupService
  def initialize(test_completion)
    @test_completion = test_completion
  end

  def badges_with_tests
    badges = Badge.select { |badge| tests(badge).include?(@test_completion.test) }
    result = {}
    badges.each { |badge| result[badge] = tests(badge) }
    result
  end

  private

  def tests(badge)
    case badge.group_type
      when 'SingleTest'
      Test.where(title: badge.group_value)
    when 'AllTestsWithCategory'
      Test.where(category: Category.find_by(name: badge.group_value))
    when 'AllTestsWithLevel'
      Test.where(level: badge.group_value)
    end
  end
end
