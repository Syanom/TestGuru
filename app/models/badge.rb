class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_one :group, autosave: true
  has_one :rule, autosave: true
  has_many :users, through: :badge_allotments

  validates :group, presence: true
  validates :rule, presence: true

  delegate :type, :type=, :value, :value=, to: :built_group, prefix: :group
  delegate :tests, to: :built_group
  delegate :type, :type=, :value, :value=, to: :built_rule, prefix: :rule
  delegate :count_badges_to_assign, to: :built_rule

  scope :badges_with_test, ->(test) { select { |badge| badge.tests.include?(test) } }

  def self.assign_badges(test_completion)
    badges_with_test(test_completion.test).each do |badge|
      badge.update_badge_allotment(badge.count_badges_to_assign(test_completion.user), test_completion.user)
    end
  end

  def update_badge_allotment(number_of_badges, user)
    return if number_of_badges <= 0

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

  def built_group
    group || build_group
  end

  def built_rule
    rule || build_rule
  end
end
