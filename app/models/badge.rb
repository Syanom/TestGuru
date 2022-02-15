class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :users, through: :badge_allotments

  GROUP_TYPES = %w[SingleTest AllTestsWithCategory AllTestsWithLevel].freeze
  RULE_TYPES = %w[Attempts CompletionTime Completion].freeze

  validates :group_type, inclusion: { in: GROUP_TYPES, message: 'Group type is not a valid type' }
  validates :rule_type, inclusion: { in: RULE_TYPES, message: 'Rule type is not a valid type' }

  scope :badges_with_test, ->(test) { select { |badge| badge.tests.include?(test) } }

  def tests
    case group_type
    when 'SingleTest'
      Test.where(title: group_value)
    when 'AllTestsWithCategory'
      Test.where(category: Category.find_by(name: group_value))
    when 'AllTestsWithLevel'
      Test.where(level: group_value)
    end
  end
end
