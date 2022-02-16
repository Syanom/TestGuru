class BadgesController < ApplicationController
  def index
    @earned_badges = Badge.select { |badge| badge.users.include?(current_user) }
    @unearned_badges = Badge.all - @earned_badges
  end
end
