require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:my_category) { create(:category) }
  
  it { is_expected.to have_many(:posts) }
  
  describe "attributes" do
    it "has name, description, and public attributes" do
      expect(my_category).to have_attributes(name: my_category.name, description: my_category.description, public: my_category.public)
    end
    
    it "is public by default" do
       expect(my_category.public).to be(true)
     end
  end
end
