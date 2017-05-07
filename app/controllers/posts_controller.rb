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
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @category = Category.find(params[:category_id])
    @post.category = @category

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
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
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
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.category
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
  
end
