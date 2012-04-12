class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params[:category])
    redirect_to admin_categories_path, :notice => "Category created."
  end

  def show
    @category = Category.find(params[:id])
    @products = ProductCategory.find_all_by_category_id(params[:id]).map(&:product)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    Category.find(params[:id]).update_attributes(params[:category])
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end
end