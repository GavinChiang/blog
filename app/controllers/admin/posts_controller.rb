class Admin::PostsController < AdminController
 
  def index
    @posts = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
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

    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :subtitle, :category_id, :slug, :is_private)
  end
end
