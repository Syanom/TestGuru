class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:unlogged_path) || root_path
    else
      flash.now[:alert] = 'Incorrect e-mail or password'
      render :new
    end
  end

  def delete
    session.destroy
    redirect_to root_path
  end
end