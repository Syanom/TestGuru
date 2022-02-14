class Group < ApplicationRecord
  belongs_to :badge

  alias group_type type
  alias group_value value

  def tests
    return Test.where(title: value) if type == 'test'
    return Test.where(category: Category.find_by(name: value)) if type == 'category'
    return Test.where(level: value.to_i) if type == 'level'
  end
end
