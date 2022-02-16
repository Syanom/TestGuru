class Badge < ApplicationRecord
  enum group_type: %i[SingleTest AllTestsWithCategory AllTestsWithLevel]
  enum rule_type: %i[Attempts CompletionTime Completion]

  belongs_to :author, class_name: 'User'

  has_many :badge_allotments
  has_many :users, through: :badge_allotments
end
