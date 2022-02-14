class Group < ApplicationRecord
  belongs_to :badge

  def tests
    return Test.where(title: group_value) if group_type == 'test'
    return Test.where(category: Category.find_by(name: group_value)) if group_type == 'category'
    return Test.where(level: group_value.to_i) if group_type == 'level'
  end
end
