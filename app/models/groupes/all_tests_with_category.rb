class AllTestsWithCategory < Group
  def tests
    Test.where(category: Category.find_by(name: value))
  end
end
