class PostsController < ApplicationController

  # add conditional for whether the user is trying to
  # access the index of all posts (Post.all - /posts ) or
  # just the index of all posts by a certain author (Author.find(params[:author_id]).posts - /authors/:id/posts)
  def index
    if params[:author_id]
      @posts = Author.find(params[:author_id]).posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :desription, :post_status, :author_id)
  end
end
