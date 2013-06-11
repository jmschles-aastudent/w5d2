class FriendCirclesController < ApplicationController
  def index
    # @friends = current_user.friends
  end

  def create
    if current_user
      # create friendships
    else
      redirect_to login_url
    end
  end
end
