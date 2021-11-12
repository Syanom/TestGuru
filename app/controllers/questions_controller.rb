class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
