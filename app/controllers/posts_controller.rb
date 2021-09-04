class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update, :destroy, :show]
  
  def index
    @posts = Post.order(id: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to "/", notice: "發布成功！"
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      redirect_to "/", notice: "已編輯！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to "/", notice: "已刪除！"
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(id: :asc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params["id"])
  end
end
