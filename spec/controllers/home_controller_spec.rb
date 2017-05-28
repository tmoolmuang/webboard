require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET about" do
    it "renders about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET faq" do
    it "renders faq template" do
      get :faq
      expect(response).to render_template("faq")
    end
  end

  describe "GET contact" do
    it "renders contact template" do
      get :contact
      expect(response).to render_template("contact")
    end
  end

end
