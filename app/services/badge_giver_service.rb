class BadgeGiverService
  RULE_TYPES = {
    'attempts' => Rules::Attempts,
    'completion' => Rules::Completion,
    'completion_time' => Rules::CompletionTime
  }.freeze

  def call(test_completion)
    BadgeGroupService.new(test_completion).badges_with_tests.each do |badge, tests|
      assign_badges(
        test_completion.user,
        badge,
        RULE_TYPES[badge.rule_type].new(badge, tests, test_completion.user).count_badge_allotments
      )
    end
  end

  private

  def assign_badges(user, badge, quantity)
    badge_allotment = user.badge_allotments.find_or_initialize_by(badge: badge)

    return if quantity.zero? || badge_allotment.number_of_badges > quantity

    badge_allotment.update!(number_of_badges: quantity)
  end
end
