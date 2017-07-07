module ApplicationHelper
  def is_admin?
    user_signed_in? && current_user.admin?
  end
  
  def is_voted?(p)
    Like.where(post_id: p, user: current_user).count > 0 ? true : false
  end
end
