class MembershipsController < ApplicationController
  # before_filter :require_login
  #
  # def create
  #   params[:user_id] = params[:id]
  #   @memberships = Membership.new(params[:membership])
  #   #
  #   # @circle = FriendCircle.find(params[:id])
  #   # @membership = @circle.memberships.build(params[:membership])
  #   if @memberships.save
  #     render :json => @memberships
  #   else
  #     render :json => @memberships.errors
  #   end
  #   # @membership = Membership.new(params[:membership])
  #   # @membership.friend_circle_id = @circle.id
  #   # render :json => params
  # end
  #
  # def destroy
  #
  # end
end
