require 'rails_helper'

RSpec.describe Comment, type: :model do
  # let(:my_user) { create(:user,  confirmed_at: DateTime.now) }
  # let(:my_cat) { create(:category) }
  # let(:my_post) { create(:post, category: my_cat, user: my_user ) }
  # let(:my_comment) { create(:comment, post: my_post, user: my_user ) }
   
  # # let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }
 
  # it { is_expected.to belong_to(:my_post) }
  # it { is_expected.to belong_to(:my_user) }
  # # it { is_expected.to validate_presence_of(:body) }
  # # it { is_expected.to validate_length_of(:body).is_at_least(5) }

  # describe "attributes" do
  #   it "has a body attribute" do
  #     expect(comment).to have_attributes(body: "Comment Body")
  #   end
  # end
  
  # describe "after_create" do
  #   before do
  #     @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
  #   end
 
  #   it "sends an email to users who have favorited the post" do
  #     favorite = user.favorites.create(post: post)
  #     expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))
 
  #     @another_comment.save!
  #   end
 
  #   it "does not send emails to users who haven't favorited the post" do
  #     expect(FavoriteMailer).not_to receive(:new_comment)
 
  #     @another_comment.save!
  #   end
  # end

end
