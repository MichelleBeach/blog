class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :require_user, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

    #@comment = @post.comments.create!(params.require(:comment).permit!)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment saved' }
        format.js
      else
        format.html { redirect_to @post, notice: 'Unable to save comment' }
        format.js
      end
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
