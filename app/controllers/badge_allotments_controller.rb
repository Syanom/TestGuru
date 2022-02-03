class BadgeAllotmentsController < ApplicationController
  def index
    @badge_allotments = BadgeAllotment.where(user: current_user).to_a
  end
end
