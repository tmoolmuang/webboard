require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:std_user) { create(:user, confirmed_at: DateTime.now) }
  let(:test_cat) { create(:category) }
  let(:test_post) { create(:post, category: test_cat, user: std_user ) }
 
  it { is_expected.to belong_to(:category) }
  
  describe "attributes" do
    it "has a title and body attribute" do
      expect(test_post).to have_attributes(title: test_post.title, body: test_post.body)
    end
  end
  
end
