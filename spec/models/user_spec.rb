 require 'rails_helper'

 RSpec.describe User, type: :model do
   let(:test_user) { create(:user) }
 
   describe "attributes" do
     it "has email, and password attributes" do
       expect(test_user).to have_attributes(email: "test@test.com", password: "123abc")
     end
   end
   
 end