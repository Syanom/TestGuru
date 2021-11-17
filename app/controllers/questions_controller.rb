class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.attributes
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  def new; end

  def create
    @question = Question.new(body: params[:question_body], test_id: @test.id)
    if @question.save
      redirect_to @question
    else
      render :new
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
end
