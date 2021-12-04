module TestsHelper
  def test_header
    if @test.new_record?
      t('create_new_test')
    else
      t('edit_test', title: @test.title)
    end
  end
end
