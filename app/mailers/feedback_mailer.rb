class FeedbackMailer < ApplicationMailer
  def given_feedback(admin, feedback)
    @feedback = feedback
    mail to: admin.email
  end
end
