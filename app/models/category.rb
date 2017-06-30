class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  validates :name, presence: { message: 'Category name cannot be emptied.' }
  validates :description, presence: { message: 'Category description cannot be emptied.' }
  
  #https://stackoverflow.com/questions/9050723/order-by-child-attribute
end
