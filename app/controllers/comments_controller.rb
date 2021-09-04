class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to @post
    else
      render 'posts/show'
    end   
  end

  def edit
    comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
