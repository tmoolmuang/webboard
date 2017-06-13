class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
 
  validates :body, presence: { message: 'Comment body cannot be emptied.' }
  validates :user, presence: { message: 'A comment must have associated user.' }
end
