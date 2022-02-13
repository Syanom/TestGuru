class Group < ApplicationRecord
  belongs_to :badge

  def tests
    return Test.where(title: rule_value) if rule_type == 'test'
    return Test.where(category: Category.find_by(name: rule_value)) if rule_type == 'category'
    return Test.where(level: rule_value.to_i) if rule_type == 'level'
  end
end
