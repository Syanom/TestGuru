class BadgeGroupService
  def initialize(test_completion)
    @test_completion = test_completion
  end

  def badges_with_tests
    badges = Badge.select { |badge| tests(badge).include?(@test_completion.test) }
    result = {}
    # each with index
    badges.each { |badge| result[badge] = tests(badge) }
    result
  end

  private

  def tests(badge)
    case badge.group_type
    when 'SingleTest' then Test.where(title: badge.group_value)
    when 'AllTestsWithCategory' then Test.where(category: Category.find_by(name: badge.group_value))
    when 'AllTestsWithLevel' then Test.where(level: badge.group_value)
    else raise 'Invalid badge group'
    end
  end
end
