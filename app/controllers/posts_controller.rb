class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    params[:post][:author_id] = current_user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_url(@post)
    else
      render :json => @post.errors
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
