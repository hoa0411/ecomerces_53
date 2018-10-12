require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :controller do
  describe "GET new" do
    it "assigns a category to the view" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end
end
