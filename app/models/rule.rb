# abstract class

class Rule < ApplicationRecord
  belongs_to :badge

  RULES = %w[completion attempts completion_time].freeze

  def count_badges_to_assign(user); end
end
