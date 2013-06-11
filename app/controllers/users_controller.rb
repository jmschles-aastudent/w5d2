class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.all #.potential_friends(@user)
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
