class CommentsController < ApplicationController
  before_action :find_commentable

    def new
      @comment = Comment.new
      @user = current_user
    end

    def create

      @user = current_user
      @post = @commentable

      respond_to do |format|
        @comment = @commentable.comments.create comment_params     
        format.js
      end
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])

      respond_to do |format|
        
        @comment.destroy
        format.js
      # format.html { redirect_to users_path }
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :user_name)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end

end