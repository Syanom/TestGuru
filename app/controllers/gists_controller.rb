class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_completion = TestCompletion.find_by(test_completion_params)
    result = GistQuestionService.new(@test_completion.current_question).call

    flash_options = if result.success?
                      Gist.create!(url: result.url, author: current_user, question: @test_completion.current_question)
                      { notice: view_context.link_to(t('.success'), result.url, target: '_blank',
                                                                                class: 'link-success') }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_completion, flash_options
  end

  private

  def test_completion_params
    params.require(:test_completion).permit(:id)
  end
end
