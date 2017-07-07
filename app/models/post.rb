class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  default_scope -> { order(updated_at: :desc, created_at: :desc) }
  
  before_save { self.like ||= 0 }
  
  validates :body, presence: { message: 'Post body cannot be emptied.' }, length: { maximum: 350, message: 'Post body is limited to 350 characters.' }
  validates :category, presence: { message: 'A Post must have associated category.' }
  validates :user, presence: { message: 'A Post must have associated user.' }
end
