class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.authored_feedbacks.build(feedback_params)

    if @feedback.save
      Admin.all.each { |admin| FeedbackMailer.given_feedback(admin, @feedback).deliver_now }
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
