class PostsController < ApplicationController
  def index
    # @posts = Post.
    query = <<-SQL
      SELECT posts.*
      FROM posts
      INNER JOIN post_shares
      ON posts.id = post_shares.post_id
      INNER JOIN memberships
      ON post_shares.friend_circle_id = memberships.friend_circle_id
      WHERE memberships.friend_id = ?
    SQL
    @posts = ActiveRecord::Base.connection.execute(query, current_user.id)
    render :json => @posts
  end

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
