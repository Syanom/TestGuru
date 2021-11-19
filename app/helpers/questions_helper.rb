module QuestionsHelper
  def form_header
    if @question.new_record?
      "Create New #{@question.test.title} Question"
    else
      "Edit #{@question.test.title} Question"
    end
  end
end
