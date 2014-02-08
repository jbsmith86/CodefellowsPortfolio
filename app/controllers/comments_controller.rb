class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posts_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to posts_path
    end
  end

private

  def comment_params
    params.require(:comment).permit(:author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :content, :approved, :post_id)
  end

end
