class BadgeGroupService
  def initialize(test_completion)
    @test_completion = test_completion
  end

  def badges_with_tests
    badges = Badge.select { |badge| tests(badge).include?(@test_completion.test) }
    result = {}
    # each with index
    # Не понял, как мне тут поможет each_with_index
    # метод должен возвращать и коллекцию тестов и бейдж
    # массив с коллекциями тестов не подойдет
    badges.each { |badge| result[badge] = tests(badge) }
    result
  end

  private

  def tests(badge)
    case badge.group_type
    when 'single_test' then Test.where(title: badge.group_value)
    when 'all_tests_with_category' then Test.where(category: Category.find_by(name: badge.group_value))
    when 'all_tests_with_level' then Test.where(level: badge.group_value)
    else raise 'Invalid badge group'
    end
  end
end
