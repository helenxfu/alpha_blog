class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        flash[:notice] = "Logged in successfully"
        redirect_to user
      else
        flash[:info] = "check your email for activation link"
        redirect_to root_url
      end
    else
      flash.now[:alert] = "There was something wrong with your login details."
      flash[:notice] = "testing notice"
      flash[:random] = "random symbol in flash"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
