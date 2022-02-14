class AllTestsWithLevel < Group
  def tests
    Test.where(level: value.to_i)
  end
end
