module CommentsHelper
  def user_owned_comment?(comment)
    current_user && (current_user == comment.user || current_user.admin?)
  end
end
