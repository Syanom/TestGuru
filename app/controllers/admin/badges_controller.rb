class BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create; end
  def edit; end
  def update; end
  def destroy; end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_url, :test, :category, :attempts, :completion_time, :completion)
  end
end
