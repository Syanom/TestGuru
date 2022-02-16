class BadgesController < ApplicationController
  def index
    @unearned_badges = Badge.all - Badge.select { |badge| badge.users.include?(current_user) }
  end
end
