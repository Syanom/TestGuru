# abstract class

class Rule < ApplicationRecord
  belongs_to :badge

  RULE_TYPES = %w[Attempts CompletionTime Completion]

  validates :type, inclusion: { in: RULE_TYPES, message: '%{type} is not a valid type' }

  def count_badges_to_assign(user); end
end
