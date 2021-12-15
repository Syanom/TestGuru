class TestCompletionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_completion, only: %i[show result update]

  def show; end

  def result; end

  def update
    @test_completion.accept!(params[:answer_ids])

    if @test_completion.completed?
      TestsMailer.completed_test(@test_completion).deliver_now
      redirect_to result_test_completion_path(@test_completion)
    else
      render :show
    end
  end

  private

  def set_test_completion
    @test_completion = TestCompletion.find(params[:id])
  end
end
