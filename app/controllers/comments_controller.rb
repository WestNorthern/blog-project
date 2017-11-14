class CommentsController < ApplicationController
before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.create comment_params

      redirect_back(fallback_location: root_path)
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])

      respond_to do |format|
        
        @comment.destroy
        redirect_to @post
        format.js
      # format.html { redirect_to users_path }
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end

end