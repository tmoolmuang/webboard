class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
 
  validates :name, presence: { message: 'Category name cannot be emptied.' }
  validates :description, presence: { message: 'Category description cannot be emptied.' }
end
