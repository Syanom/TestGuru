class Badge < ApplicationRecord
  has_one :group, inverse_of: :badge, dependent: :destroy, autosave: true
  delegate :tests, :test, :test=, :category, :category=, :level, :level=, to: :group
  has_one :rule, inverse_of: :badge, dependent: :destroy, autosave: true
  has_many :users, through: :badge_allotments

  def self.assign_badges(test_completion); end
end
