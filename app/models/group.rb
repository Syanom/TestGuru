class Group < ApplicationRecord
  belongs_to :badge
  belongs_to :test, optional: true
  belongs_to :category, optional: true

  # If you add any new fields for groups,
  # don't forget to add them in this validation
  validate :one_group_assigned

  def tests
    return Test.where(id: test.id) unless test.nil?
    return Test.where(category: category) unless category.nil?
    return Test.where(level: level) unless level.nil?
  end

  private

  def one_group_assigned
    available_groups = [test, category, level]
    groups_in_use_counter = 0
    available_groups.each do |group|
      groups_in_use_counter += 1 unless group.nil?
    end
    errors.add :base, 'One and only one group must be assigned' if groups_in_use_counter != 1
    groups_in_use_counter
  end
end
