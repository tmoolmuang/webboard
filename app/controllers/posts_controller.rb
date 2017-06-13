class PostsController < ApplicationController
  include ApplicationHelper
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.build(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to [@category, @post]
    else
      flash.now[:alert] = error_messages(@post)
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    
    if @post.save
      flash[:notice] = "Post was updated successfully."
      redirect_to [@post.category, @post]
    else
      flash.now[:alert] = error_messages(@post)
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "Post was deleted successfully."
      redirect_to @post.category
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:body)
  end
end
