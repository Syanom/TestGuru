class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_email] = user.email
      redirect_to root_path
    else
      flash.now[:alert] = 'Incorrect e-mail or password'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
