require "rails_helper"

RSpec.describe Admin::CategoriesController do
  let(:category) { create(:category) }
  let(:user) { create(:user, :admin) }

  before { sign_in(user) }

  describe "#index" do
    it "gets index" do
      get admin_categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "gets new" do
      get new_admin_category_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "creates category" do
      category_attributes = attributes_for(:category)
      expect {
        post admin_categories_path, :params => { :category => category_attributes }
      }.to change { Category.count }

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "#show" do
    it "shows a category" do
      get admin_categories_path(:url => category.url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "gets edit" do
      get admin_categories_path(:url => category.url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    let(:category_attributes) { attributes_for(:category) }

    it "updates a category" do
      patch admin_category_path(:url => category.url), :params => { :category => category_attributes }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "#destroy" do
    let!(:category) { create(:category) }

    it "destroys a category" do
      expect {
        delete admin_category_path(:url => category.url)
      }.to change { Category.count }.by(-1)

      expect(response).to redirect_to(admin_categories_path)
    end
  end

  context "moving categories" do
    let!(:category) { create(:category) }
    let!(:category_other) { create(:category, :name => "Fategory", :category_collection => category.category_collection) }

    describe "#move_down" do
      let!(:position) { category.position }

      it "moves category down" do
        post move_down_admin_category_path(:url => category.url)
        expect(category.reload.position).to eq(position + 1)
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    describe "#move_up" do
      let!(:position) { category_other.position }

      it "moves category up" do
        post move_up_admin_category_path(category_other.url)
        expect(category_other.reload.position).to eq(position - 1)
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    describe "#move_to_top" do
      it "moves category to top of list" do
        post move_to_top_admin_category_path(:url => category.url)
        expect(category.reload.position).to eq(1)
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    describe "#move_to_bottom" do
      it "moves category to bottom of list" do
        collection = category.category_collection
        post move_to_bottom_admin_category_path(:url => category.url)
        expect(category.reload.position).to eq(collection.categories.length)
        expect(response).to redirect_to(admin_categories_path)
      end
    end
  end
end
