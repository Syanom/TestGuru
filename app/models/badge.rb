class Badge < ApplicationRecord
  has_one :group, dependent: :destroy, autosave: true
  delegate :tests, :test, :test=, :category, :category=, :level, :level=, to: :built_group
  has_one :rule, dependent: :destroy, autosave: true
  delegate :count_badges_to_assign, :completion, :completion=, :completion_time, :completion_time=, :attempts,
           :attempts=, to: :built_rule

  has_many :users, through: :badge_allotments

  def self.assign_badges(test_completion)
    Badge.badges_with_test(test_completion.test).each do |badge|
      badge.update_badge_allotment(badge.count_badges_to_assign(test_completion.user), test_completion.user)
    end
  end

  def self.badges_with_test(test)
    Badge.all.select { |badge| badge.tests.include?(test) }
  end

  def update_badge_allotment(number_of_badges, user)
    badge_allotment = BadgeAllotment.find_by(user: user, badge: self)
    if badge_allotment.nil?
      badge_allotment = BadgeAllotment.new(user: user, badge: self, number_of_badges: number_of_badges)
      badge_allotment.save!
    elsif badge_allotment.number_of_badges < number_of_badges
      badge_allotment.number_of_badges = number_of_badges
      badge_allotment.save!
    end
  end

  private

  # I understand, that next two methods are not DRY,
  # but I'm not good at metaprogramming
  def built_group
    group || build_group
  end

  def built_rule
    rule || build_rule
  end
end
