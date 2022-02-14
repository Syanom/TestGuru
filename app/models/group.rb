# abstract class

class Group < ApplicationRecord
  belongs_to :badge

  def tests; end
end
