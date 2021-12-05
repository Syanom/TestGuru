class TestsMailer < ApplicationMailer
  def completed_test(test_completion)
    @user = test_completion.user
    @test = test_completion.test

    mail to: @user.email
  end
end
