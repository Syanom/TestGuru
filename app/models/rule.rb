# abstract class

class Rule < ApplicationRecord
  belongs_to :badge

  RULES = %w[completion attempts completion_time].freeze

  alias rule_type type
  alias rule_value value

  def count_badges_to_assign(user); end
end
