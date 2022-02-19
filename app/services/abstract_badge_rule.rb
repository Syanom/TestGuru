class AbstractBadgeRule
  def initialize(badge, tests, user)
    @badge = badge
    @user = user
    @tests = tests
  end

  def count_badge_allotments; end
end
