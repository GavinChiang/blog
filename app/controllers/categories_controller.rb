class CategoriesController < ApplicationController

  before_action :authenticate_user!

  def index
    # @categories = Category.all.order("create_at DESC")
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
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

  private
  def category_params
    params.require(:category).permit(:title)
  end

end
