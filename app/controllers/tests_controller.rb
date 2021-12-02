class TestsController < ApplicationController
  before_action :authenticate_user!

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_completion(@test)
  end

  def index
    @tests = Test.all
  end
end
