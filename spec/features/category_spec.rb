require 'rails_helper'

RSpec.describe "Category", :type => feature do
  let(:admin_user) { create(:user, role: :admin, confirmed_at: DateTime.now) }
  let(:std_user) { create(:user, confirmed_at: DateTime.now) }
  let(:test_cat) { create(:category) }
  let(:edited_test_cat) { create(:category) }

  feature 'View categories' do        
    scenario 'allows viewing the list of all categories' do
      visit categories_path
      expect(page).to have_no_content 'New Category'
    end
  end
  
  feature 'Create new category' do        
    scenario 'not allow registered user to add new category' do
      login_as(std_user)
      visit categories_path
      expect(page).to have_no_content 'New Category'
    end
      
    scenario 'allows admin to add new category' do
      login_as(admin_user)
      visit categories_path
      click_on "New Category"
      fill_in 'category_name', :with => test_cat.name
      fill_in 'category_description', :with => test_cat.description
      click_on 'Save'
      expect(page).to have_content 'Category was saved successfully'
    end
    
    scenario 'allows admin to edit category' do
      login_as(admin_user)
      visit categories_path
      click_on "New Category"
      fill_in 'category_name', :with => test_cat.name
      fill_in 'category_description', :with => test_cat.description
      click_on 'Save'
      visit edit_category_path test_cat.id
      fill_in 'category_name', :with => edited_test_cat.name
      fill_in 'category_description', :with => edited_test_cat.description
      uncheck 'category_public'
      click_on 'Save'
      expect(page).to have_content 'Category was updated successfully'
    end
    
    scenario 'allows canceling out from add new category' do
      login_as(admin_user)
      visit categories_path
      click_on "New Category"
      fill_in 'category_name', :with => test_cat.name
      fill_in 'category_description', :with => test_cat.description
      click_on 'Cancel'
      expect(page).to have_content 'New Category'
    end
  end
  
  feature 'Delete category' do        
    scenario 'allows admin to delete category' do
      login_as(admin_user)
      visit categories_path
      click_on "New Category"
      fill_in 'category_name', :with => test_cat.name
      fill_in 'category_description', :with => test_cat.description
      click_on 'Save'
      visit edit_category_path test_cat.id
      fill_in 'category_name', :with => edited_test_cat.name
      fill_in 'category_description', :with => edited_test_cat.description
      uncheck 'category_public'
      click_on 'Save'
      click_on "Delete Category"
      expect(page).to have_content 'was deleted successfully'
    end
  end
end