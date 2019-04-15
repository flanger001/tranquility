require "rails_helper"

RSpec.describe Admin::ProductsController do
  let(:product) { create(:product) }
  let(:user) { create(:user, :admin) }

  before { sign_in(user) }

  describe "#index" do
    it "fetches a list of products" do
      get admin_products_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns a new product form" do
      get new_admin_product_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    let(:product_attributes) { attributes_for(:product) }

    it "creates product" do
      expect {
        post admin_products_path, :params => { :product => product_attributes }
      }.to change { Product.count }.by(1)
      expect(response).to redirect_to(admin_product_path(Product.last))
    end
  end

  describe "#show" do
    it "shows a product" do
      get admin_product_path(:url => product.url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#edit" do
    it "returns an edit product form" do
      get edit_admin_product_path(:url => product.url)
      expect(response).to have_http_status(:success)
    end
  end

  context "#update" do
    let(:product_attributes) { attributes_for(:product) }

    it "updates a product" do
      patch admin_product_path(:url => product.url), :params => { :product => product_attributes }
      expect(response).to redirect_to(admin_product_path(product))
    end
  end

  context "#destroy" do
    let!(:product) { create(:product) }

    it "destroys a product" do
      expect {
        delete admin_product_path(:url => product.url)
      }.to change { Product.count }.by(-1)
      expect(response).to redirect_to(admin_products_path)
    end
  end

  context "moving products" do
    let!(:product) { create(:product, :position => 1) }
    let!(:product_other) { create(:product, :position => 2, :name => "Hotter towels", :category => product.category) }

    describe "#move_down" do
      let!(:position) { product.position }

      it "moves product down" do
        post move_down_admin_product_path(:url => product.url)
        expect(product.reload.position).to eq(position + 1)
        expect(response).to redirect_to(admin_products_path)
      end
    end

    describe "#move_up" do
      let!(:position) { product_other.position }

      it "moves product up" do
        post move_up_admin_product_path(:url => product_other.url)
        expect(product_other.reload.position).to eq(position - 1)
        expect(response).to redirect_to(admin_products_path)
      end
    end

    describe "#move_to_top" do
      it "moves product to top of list" do
        post move_to_top_admin_product_path(:url => product.url)
        expect(product.reload.position).to eq(1)
        expect(response).to redirect_to(admin_products_path)
      end
    end

    describe "#move_to_bottom" do
      before { create_list(:product, 2, :category => product.category) }

      it "moves product to bottom of list" do
        post move_to_bottom_admin_product_path(:url => product.url)
        expect(product.reload.position).to eq(4)
        expect(response).to redirect_to(admin_products_path)
      end
    end
  end
end
