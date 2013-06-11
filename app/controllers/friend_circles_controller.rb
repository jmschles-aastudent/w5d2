class FriendCirclesController < ApplicationController
  before_filter :require_login

  def index
    # @friends = current_user.friends
    @circles = current_user.friend_circles
    render :json => @circles
  end

  def show
    friend_circles = current_user.friend_circles
    @circle = friend_circles.find(params[:id])
    @users = User.all - [current_user] # TODO: #potential_friends method
    # @circle = FriendCircle.find(params[:id])
    # render :json => @circle
    render :show
  end

  def new
    @circle = FriendCircle.new
  end

  def create
    @circle = current_user.friend_circles.build(params[:friend_circle])
    # @circle = FriendshipCircle.new(params[:friendship_circle])
    if @circle.save
      redirect_to friend_circle_url(@circle)
    else
      render :new
    end
  end

  def update
    @circle = FriendCircle.find(params[:id])
    if @circle.update_attributes(params[:friend_circle])
      redirect_to friend_circle_url(@circle)
      # render :json => @circle
    else
      render :json => @circle.errors
    end
  end

end
