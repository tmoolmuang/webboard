require 'rails_helper'

RSpec.describe "Post", :type => feature do
  let(:admin_user) { create(:user, role: :admin, confirmed_at: DateTime.now) }
  let(:std_user) { create(:user, confirmed_at: DateTime.now) }
  let(:test_cat) { create(:category) }

  feature 'Create post' do        
    scenario 'allows user to create post' do
      login_as(admin_user)
      create_category
      click_on 'Sign Out'
      login_as(std_user)
      create_post
      expect(page).to have_content "Post was created successfully"
    end
    
    scenario 'not allow guest to create post' do
      login_as(admin_user)
      create_category
      click_on 'Sign Out'
      visit category_path(id: '1')
      expect(page).to have_no_content "New Post"
    end
  end
  
  feature 'View post' do     
    scenario 'allows anyone to view post' do
      login_as(admin_user)
      create_category
      create_post
      click_on 'Sign Out'
      visit category_post_path(category_id: '1', id: '1')
      expect(page).to have_content "new post body"
      expect(page).to have_no_content "Delete Post"
    end
  end
  
  # allow user to edit his/her own post
  # allow admin to edit, delete any post
  
  private
  def create_category
      visit categories_path
      click_on "New Category"
      fill_in 'category_name', :with => test_cat.name
      fill_in 'category_description', :with => test_cat.description
      click_on 'Save'  
  end
  
  def create_post
    visit category_path(id: '1')
    click_on 'New Post'
    fill_in 'post_title', :with => "new post title"
    fill_in 'post_body', :with => "new post body"
    click_on 'Save'
  end
  
  
end