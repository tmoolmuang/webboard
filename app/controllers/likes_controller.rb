class LikesController < ApplicationController
  def like
    if user_signed_in?
      @post = Post.find(params[:post_id])
      if @post.like == nil || @post.like == 0
        @post.like = 1
      else
        @post.like = @post.like + 1
      end
      
      @like = Like.new
      @like.post_id = @post.id
      @like.user = current_user
      
      @like.save
      @post.save
    end
    redirect_to :back
  end
  
  def unlike
    if user_signed_in?
      @post = Post.find(params[:post_id])
      if @post.like != nil || @post.like > 0
        @post.like = @post.like - 1
      end
      
      @like = Like.where(post_id: params[:post_id], user: current_user)
      if @like.count > 0
        @like.destroy_all
        @post.save
      end
    end
    redirect_to :back
  end
end
