class CommentsController < ApplicationController
   
    def new
        @comment = Comment.new
    end
    
   def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to root_path
  end

   
    def show
        @comment = Comment.find([:post_id])
        @comment = post.comment.all
    end


    private

    def comment_params
        params.require(:comment).permit(:id, :post_id, :user_id, :content)
    end
end
