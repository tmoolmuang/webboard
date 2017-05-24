require 'rails_helper'

RSpec.describe "Category", :type => feature do

  feature "Add New Category" do
    scenario "add new category" do
      visit new_category_path
      fill_in("category_name", :with => "New!! Category")
      fill_in("category_description", :with => "Some content")
      click_on "Save"
      expect(page).to have_content("New!! Category")
    end
    
    scenario "add 'blank' category with description" do
      visit new_category_path
      fill_in("category_description", :with => "Some content")
      click_on "Save"
      expect(page).to have_content("Category name cannot be emptied")
    end
    
    scenario "add category with 'blank' description" do
      visit new_category_path
      fill_in("category_name", :with => "New!! Category")
      click_on "Save"
      expect(page).to have_content("Category description cannot be emptied")
    end
    
    scenario "cancel out" do
      visit new_category_path
      click_on "Cancel"
      expect(page).to have_content("New Category")
    end


  end

end