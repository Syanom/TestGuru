class Test < ApplicationRecord
  def self.tests_by_category(category_name)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { name: category_name })
      .order(title: :DESC)
      .pluck(:title)
  end
end
