class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @likes = @post.get_likes.size
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update!(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  def like
    post = Post.find(params[:post_id])
    if current_user.voted_up_on? post
      current_user.dislikes post
    else
      current_user.likes post
    end
    redirect_to post
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
