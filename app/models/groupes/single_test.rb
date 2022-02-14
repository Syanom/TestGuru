class SingleTest < Group
  def tests
    Test.where(title: value)
  end
end
