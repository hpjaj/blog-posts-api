class CategoriesController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  respond_to :json

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category.to_json, status: :created 
    else
      render json: @category.errors.full_messages, status: :unprocessable_entity 
    end
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      render json: @category.to_json, status: :no_content 
    else
      render json: @category.errors.full_messages, status: :unprocessable_entity 
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    head :no_content
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

end
