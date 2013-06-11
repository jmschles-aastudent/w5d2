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
    # @circle = FriendCircle.find(params[:id])
    render :json => @circle
  end

  def new
    @circle = FriendCircle.new
  end

  def create
    @circle = current_user.friendship_circle.build(params[:friendship_circle])
    # @circle = FriendshipCircle.new(params[:friendship_circle])
    if @circle.save
      redirect_to friend_circle_url(@circle)
    else
      render :new
    end
  end
end
