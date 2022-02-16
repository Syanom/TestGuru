class BadgesController < ApplicationController
  def index
    @unearned_badges = Badge.all - current_user.badges
  end
end
