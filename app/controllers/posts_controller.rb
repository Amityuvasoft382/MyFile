class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def new
    @post = Post.new
    @like = Like.all
  end

  # def create
  #   @post = Post.new(post_params)
  #   @post.save
  #   @posts = Post.all
  # end

 def create
    @post = Post.new(post_params)
    @posts = Post.all
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end
    
  
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    if @post.destroy
      redirect_to root_path, notice: "Post deleted."
    end
  end

  private
  def post_params
    params.require(:post).permit(:id, :user_id, :title, :text)
  end
end
