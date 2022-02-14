# abstract class

class Group < ApplicationRecord
  belongs_to :badge

  GROUP_TYPES = %w[SingleTest AllTestsWithCategory AllTestsWithLevel].freeze

  validates :type, inclusion: { in: GROUP_TYPES, message: '%{type} is not a valid type' }

  def tests; end
end
