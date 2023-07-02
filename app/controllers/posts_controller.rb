class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render status: :unprocessable_entity
    end
  end

  def index
    @posts = Posts.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end