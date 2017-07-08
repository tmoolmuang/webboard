require 'rails_helper'

RSpec.describe "Comment", :type => feature do
  let(:admin_user) { create(:user, role: :admin, confirmed_at: DateTime.now) }
  let(:std_user) { create(:user, confirmed_at: DateTime.now) }
  let(:test_cat) { create(:category) }
  let(:test_post) { create(:post) }

  feature 'Create comment' do        
    scenario 'allows user to create comment' do
      login_as(admin_user)
      create_category
      click_on 'Sign Out'
      login_as(std_user)
      create_post
      create_comment
      expect(page).to have_content "new comment body"
    end
    
    scenario 'not allow guest to create comment' do
      login_as(admin_user)
      create_category
      click_on 'Sign Out'
      visit category_path(id: '1')
      expect(page).to have_no_content "Add a comment"
    end
  end
  
  feature 'View comment' do     
    scenario 'allows anyone to view comments' do
      login_as(admin_user)
      create_category
      create_post
      click_on 'Sign Out'
      visit category_post_path(category_id: '1', id: '1')
      expect(page).to have_content "Comments"
      expect(page).to have_no_content "Add a comment"
    end
  end

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
    fill_in 'post_body', :with => "new post body"
    click_on 'Save'
  end
  
  def create_comment
    visit category_post_path(category_id: '1', id: '1')
    fill_in 'comment_body', :with => "new comment body"
    click_on 'Submit Comment'
  end

end