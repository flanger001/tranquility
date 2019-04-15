require "rails_helper"

RSpec.describe Admin::CategoryCollectionsController do
  let(:category_collection) { create(:category_collection) }
  let(:user) { create(:user, :admin) }

  before { sign_in(user) }

  describe "#index" do
    it "gets index" do
      get admin_category_collections_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "gets new" do
      get new_admin_category_collection_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:category_collection_attributes) { attributes_for(:category_collection) }

    it "creates a category collection" do
      expect {
        post admin_category_collections_path, :params => { :category_collection => category_collection_attributes }
      }.to change { CategoryCollection.count }.by(1)

      expect(response).to redirect_to(admin_category_collection_path(CategoryCollection.last))
    end
  end

  describe "#show" do
    it "shows a category collection" do
      get admin_category_collection_path(:url => category_collection.url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "gets edit" do
      get edit_admin_category_collection_path(:url => category_collection.url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    let(:category_collection_attributes) { attributes_for(:category_collection) }

    it "updates a category collection" do
      patch admin_category_collection_path(:url => category_collection.url), :params => { :category_collection => category_collection_attributes }
      expect(response).to redirect_to(admin_category_collection_path(category_collection))
    end
  end

  describe "#destroy" do
    let!(:category_collection) { create(:category_collection) }

    it "destroys a category collection" do
      expect {
        delete admin_category_collection_path(:url => category_collection.url)
      }.to change { CategoryCollection.count }.by(-1)
      expect(response).to redirect_to(admin_category_collections_path)
    end
  end

  context "moving category collections" do
    let!(:category_collection) { create(:category_collection) }
    let!(:category_collection_other) { create(:category_collection, :name => "Perfections") }

    describe "#move_down" do
      let!(:position) { category_collection.position }

      it "moves category_collection down" do
        post move_down_admin_category_collection_path(:url => category_collection.url)
        expect(category_collection.reload.position).to eq(position + 1)
        expect(response).to redirect_to(admin_category_collections_path)
      end
    end

    describe "#move_up" do
      let!(:position) { category_collection_other.position }

      it "moves category_collection up" do
        post move_up_admin_category_collection_path(:url => category_collection_other.url)
        expect(category_collection_other.reload.position).to eq(position - 1)
        expect(response).to redirect_to(admin_category_collections_path)
      end
    end

    describe "#move_to_top" do
      it "moves category collection to top of list" do
        post move_to_top_admin_category_collection_path(:url => category_collection.url)
        expect(category_collection.reload.position).to eq(1)
        expect(response).to redirect_to(admin_category_collections_path)
      end
    end

    describe "#move_to_bottom" do
      let(:collections_all) { CategoryCollection.all }

      it "moves category collection to bottom of list" do
        post move_to_bottom_admin_category_collection_path(:url => category_collection.url)
        expect(category_collection.reload.position).to eq(collections_all.length)
        expect(response).to redirect_to(admin_category_collections_path)
      end
    end
  end
end
