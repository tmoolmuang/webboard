require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:my_category) { create(:category) }
  
  describe "attributes" do
    it "has name, description, and public attributes" do
      expect(my_category).to have_attributes(name: my_category.name, description: my_category.description, public: my_category.public)
    end
  end
   
end
