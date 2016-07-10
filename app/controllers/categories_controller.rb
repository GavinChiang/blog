class CategoriesController < ApplicationController

  before_action :authenticate_user!

  def index
    # @categories = Category.all.order("create_at DESC")
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to posts_path
    else
      render 'new'
    end

  end


  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end


  private
  def category_params
    params.require(:category).permit(:title)
  end

end
