class FriendCirclesController < ApplicationController
  def index
    # @friends = current_user.friends
  end

  def show
    # @friend_circle = FriendCircle.find(params[:id])
    render :json => params
  end

  def new
    @circle = FriendCircle.new
  end

  def create
    if current_user
      # create friendships
    else
      redirect_to login_url
    end
  end
end
