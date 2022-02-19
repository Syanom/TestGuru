class Badge < ApplicationRecord
  enum group_type: %i[SingleTest AllTestsWithCategory AllTestsWithLevel]
  enum rule_type: { Attempts: 0, CompletionTime: 1, Completion: 2 }

  belongs_to :author, class_name: 'User'

  has_many :badge_allotments
  has_many :users, through: :badge_allotments
end
