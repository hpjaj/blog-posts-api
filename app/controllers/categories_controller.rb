class CategoriesController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  respond_to :html, :json

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.json { render json: @category.to_json, status: :created }
        format.html { redirect_to categories_path }
      end
    else
      respond_to do |format|
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
        format.html do
          flash[:error] = @category.errors.full_messages
          render :new
        end
      end
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
      respond_to do |format|
        format.json { render json: @category.to_json, status: :no_content }
        format.html { redirect_to categories_path }
      end
    else
      respond_to do |format|
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
        format.html do
          flash[:error] = @category.errors.full_messages
          render :edit
        end
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to root_path }
      end
    else
      render :show
    end
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

end
