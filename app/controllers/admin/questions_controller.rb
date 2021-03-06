class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show; end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def update_inline
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: 'The question is not found'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
