# abstract class

class Rule < ApplicationRecord
  belongs_to :badge

  def count_badges_to_assign(user); end
end
