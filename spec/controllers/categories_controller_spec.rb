require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:admin_user) { create(:user, role: :admin, confirmed_at: DateTime.now) }
  let(:my_cat) { create(:category) }
  
  describe "GET all categories" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  
    it "assigns [my_cat] to @categories" do
      get :index
      expect(assigns(:categories)).to eq([my_cat])
    end
  end
   
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @category" do
      get :new
      expect(assigns(:category)).not_to be_nil
    end
  end
 
  describe "category create" do
    # it "increases the number of Category by 1" do
    #   expect{ post :create, category: {name: "name", description: "desc", public: true} }.to change(Category, :count).by(1)
    # end

    # it "assigns the new category to @category" do
    #   post :create, category: {name: "name", description: "desc", public: true}
    #   expect(assigns(:category)).to eq Category.last
    # end

    it "redirects to the new category" do
      post :create, category: {name: "name", description: "desc", public: true}
      expect(response).to redirect_to Category.last
    end
  end
  
  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_cat.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: my_cat.id}
      expect(response).to render_template :show
    end
    
    it "assigns my_cat to @category" do
      get :show, {id: my_cat.id}
      expect(assigns(:category)).to eq(my_cat)
    end
  end
   
  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_cat.id}
      expect(response).to have_http_status(:success)
    end
  
    it "renders the #edit view" do
      get :edit, {id: my_cat.id}
      expect(response).to render_template :edit
    end
  
    it "assigns category to be updated to @category" do
      get :edit, {id: my_cat.id}
  
      cat_instance = assigns(:category)
  
      expect(cat_instance.id).to eq my_cat.id
      expect(cat_instance.name).to eq my_cat.name
      expect(cat_instance.description).to eq my_cat.description
      expect(cat_instance.public).to eq my_cat.public
    end
  end
  
  describe "PUT update" do
    it "updates category with expected attributes" do
      new_name = "new name"
      new_desc = "new desc"
      new_public = false
  
      put :update, id: my_cat.id, category: {name: new_name, description: new_desc, public: new_public}
  
      updated_cat = assigns(:category)
      expect(updated_cat.id).to eq my_cat.id
      expect(updated_cat.name).to eq new_name
      expect(updated_cat.description).to eq new_desc
      expect(updated_cat.public).to eq new_public
    end
  
    it "redirects to the updated category" do
      new_name = "new name"
      new_desc = "new desc"
      new_public = false
  
      put :update, id: my_cat.id, category: {name: new_name, description: new_desc, public: new_public}
      expect(response).to redirect_to my_cat
    end
  end
  
  # describe "DELETE destroy" do
  #   it "deletes the category" do
  #     delete :destroy, {id: my_cat.id}
  #     count = Category.where({id: my_cat.id}).size
  #     expect(count).to eq 0
  #   end
  
  #   it "redirects to category index" do
  #     delete :destroy, {id: my_cat.id}
  #     expect(response).to redirect_to categories_path
  #   end
  # end
end
