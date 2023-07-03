class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
