class Categories::PostsController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  respond_to :json

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    @category = Category.find(params[:category_id])
    @post = current_user.posts.build(post_params)
    @post.category = @category
    if @post.save
      render json: @post.to_json, status: :created 
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity 
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      render json: @post.to_json, status: :no_content 
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity 
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content 
  end


  private

    def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end

end
