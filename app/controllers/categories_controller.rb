class CategoriesController < ApplicationController
  include ApplicationHelper
  
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @posts_page = @category.posts.order("updated_at DESC").page(params[:page]).per(6)
  end
  
  def new
    @category = Category.new
  end  
  
  def create
    @category = Category.new(cat_params)

    if !is_admin?
      flash[:alert] = "Only admin can create category."
      redirect_to @category
    else      
      if @category.save
        redirect_to @category, notice: "Category was saved successfully."
      else
        flash.now[:alert] = error_messages(@category)
        render :new
      end
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.assign_attributes(cat_params)
    
    if !is_admin?
      flash[:alert] = "Only admin can edit category."
      redirect_to @category
    else      
      if @category.save
        flash[:notice] = "Category was updated successfully."
        redirect_to @category
      else
        flash.now[:alert] = error_messages(@category)
        render :edit
      end
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    
    if !is_admin?
      flash[:alert] = "Only admin can delete category."
      redirect_to @category
    else      
      if @category.destroy
        flash[:notice] = "\"#{@category.name}\" was deleted successfully."
        redirect_to action: :index
      else
        flash.now[:alert] = "There was an error deleting the category."
        render :show
      end
    end
  end
  
  private
  def cat_params
    params.require(:category).permit(:name, :description, :public)
  end
end
