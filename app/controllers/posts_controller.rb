class PostsController < ApplicationController
  def index
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "發布成功"
      redirect_to "/"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
