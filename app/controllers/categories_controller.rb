class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 20)
  end

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 20)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully"
      redirect_to @category
    else
      flash[:alert] = "something wrong"
      render "new"
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category updated successfully"
      redirect_to @category
    else
      flash[:alert] = "something wrong"
      render "edit"
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category name destroyed."
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "You are not admin."
      redirect_to categories_path
    end
  end
end
