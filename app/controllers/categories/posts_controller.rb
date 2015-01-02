class Categories::PostsController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  respond_to :html, :json

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    @category = Category.find(params[:category_id])
    @post = current_user.posts.build(post_params)
    
    # @post = Post.new(post_params)
    @post.category = @category
    if @post.save
      respond_to do |format|
        format.json { render json: @post.to_json, status: :created }
        format.html { redirect_to [@category, @post] }
      end
    else
      respond_to do |format|
        format.json { render json: @post.errors.full_messages, status: :unprocessable_entity }
        format.html do
          flash[:error] = @post.errors.full_messages
          render :new
        end
      end
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
      respond_to do |format|
        format.json { render json: @post.to_json, status: :no_content }
        format.html { redirect_to [@category, @post] }
      end
    else
      respond_to do |format|
        format.json { render json: @post.errors.full_messages, status: :unprocessable_entity }
        format.html do
          flash[:error] = @post.errors.full_messages
          render :edit
        end
      end
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    if @post.destroy
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to @category }
      end
    else
      render :show
    end
  end


  private

    def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end

end
