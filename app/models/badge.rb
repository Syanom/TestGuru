class Badge < ApplicationRecord
  enum group_type: %i[single_test all_tests_with_category all_tests_with_level]
  enum rule_type: %i[attempts completion_time completion]
  belongs_to :author, class_name: 'User'

  has_many :badge_allotments
  has_many :users, through: :badge_allotments
end
