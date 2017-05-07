class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  validates :title, presence: { message: 'Post title cannot be emptied.' }
  validates :body, presence: { message: 'Post body cannot be emptied.' }
  validates :category, presence: { message: 'A Post must have associated category.' }
  
end
