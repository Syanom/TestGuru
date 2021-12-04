module TestsHelper
  def test_header
    if @test.new_record?
      t('admin.tests.for_helper.create_new_test')
    else
      t('admin.tests.for_helper.edit_test', title: @test.title)
    end
  end
end
