module PostsHelper
  def user_owned_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end
end
