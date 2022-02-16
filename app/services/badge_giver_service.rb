class BadgeGiverService
  RULES = {
    'Attempts' => Attempts,
    'Completion' => Completion,
    'CompletionTime' => CompletionTime
  }.freeze

  def call(test_completion)
    Badge.badges_with_test(test_completion.test).each do |badge|
      assign_badges(test_completion.user, badge,
                    RULES[badge.rule_type].new(badge, test_completion.user).count_badge_allotments)
    end
  end

  private

  def assign_badges(user, badge, quantity)
    badge_allotment = user.badge_allotments.find_or_initialize_by(badge: badge)

    return if quantity <= 0 || badge_allotment.number_of_badges > quantity

    badge_allotment.number_of_badges = quantity
    badge_allotment.save!
  end
end
