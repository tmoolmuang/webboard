class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :body, presence: { message: 'Post body cannot be emptied.' }, length: { maximum: 175, message: 'Post body is limited to 175 characters.' }
  validates :category, presence: { message: 'A Post must have associated category.' }
  validates :user, presence: { message: 'A Post must have associated user.' }
end
