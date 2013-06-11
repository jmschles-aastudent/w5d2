class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user.correct_password?(params[:user][:password])
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def new
  end

  def destroy
    if current_user
      current_user.destroy_session_token!
    end
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
