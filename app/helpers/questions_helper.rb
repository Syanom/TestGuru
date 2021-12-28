module QuestionsHelper
  def question_header
    if @question.new_record?
      t('admin.questions.for_helper.create_new_question', test_title: @question.test.title)
    else
      t('admin.questions.for_helper.edit_question', body: @question.body)
    end
  end
end
