class Badge < ApplicationRecord
  enum group_type: %i[SingleTest AllTestsWithCategory AllTestsWithLevel]
  enum rule_type: %i[Attempts CompletionTime Completion]

  belongs_to :author, class_name: 'User'

  has_many :badge_allotments
  has_many :users, through: :badge_allotments

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
