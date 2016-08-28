class PostsController < ApplicationController

  def index
    if user_signed_in?
      @posts = Post.all
    else
      @posts = Post.where(:is_private => false)
    end
    @posts = @posts.order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :subtitle, :category_id, :slug, :is_private)
  end
end
