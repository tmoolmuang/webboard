require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  # let(:my_user) { create(:user, confirmed_at: DateTime.now) }
  # let(:my_cat) { create(:category) }
  # let(:my_post) { create(:post, category: my_cat, user: my_user ) }
  # let(:my_comment) { create(:comment, post: my_post, user: my_user ) }
  # let(:my_updated_post) { create(:post, category: my_cat, user: my_user ) }

  # context "Comment" do
  #   describe "create" do
  #     it "increases the number of post by 1" do
  #       # expect{post :create, category_id: my_cat.id, post: {title: my_post.title, body: my_post.body}}.to change(Post,:count).by(1)
        
  #       expect{ post :create, comment: {body: "new body", user_id: my_user.id} }.to change(Comment, :count).by(1)

  #     end
   
  #     # it "assigns the new post to @post" do
  #     #   post :create, category_id: my_cat.id, post: {title: my_post.title, body: my_post.body}
  #     #   # post_instance = assigns(:post)
  #     #   # expect(post_instance.title).to eq(my_post.title)
  #     #   # expect(post_instance.body).to eq(my_post.body)
  #     #   expect(assigns(:post)).to eq my_post
  #     # end
   
  #     # it "redirects to the new post" do
  #     #   post :create, category_id: my_cat.id, post: {title: my_post.title, body: my_post.body}
  #     #   expect(response).to have_http_status(:success) # redirect_to [my_cat, Post.last]
  #     # end
  #   end

  #   # describe "GET edit" do
  #   #   it "renders the #edit view" do
  #   #     get :edit, category_id: my_cat.id, id: my_post.id
  #   #     expect(response).to render_template :edit
  #   #   end
  #   # end

  #   # describe "PUT update" do
  #   #   it "updates and assigns edited post to @post" do
  #   #     put :update, category_id: my_cat.id, id: my_post.id, post: {title: my_updated_post.title, body: my_updated_post.body}
  #   #     expect(assigns(:post)).to eq my_post
  #   #   end
  #   # end

  #   # describe "DELETE destroy" do
  #   #   it "returns http redirect" do
  #   #     delete :destroy, category_id: my_cat.id, id: my_post.id
  #   #     expect(response).to redirect_to(category_path)
  #   #   end
  #   # end
  # end
end
