require "rails_helper"

RSpec.describe CategoryCollectionsController do
  describe "#show" do
    let(:category_collection) { create(:category_collection, active: active) }
    subject { get category_collection_path(url: category_collection.url) }

    context "given an active collection" do
      let(:active) { true }

      context "with at least one category" do
        let!(:category) { create(:category, category_collection: category_collection) }

        context "with at least one product" do
          let!(:product) { create(:product, category: category) }

          it "shows the collection" do
            subject
            expect(response).to have_http_status(:success)
          end
        end

        context "without a product" do
          it "redirects to the home page" do
            subject
            expect(response).to redirect_to(root_path)
          end
        end
      end

      context "without a category" do
        it "redirects to the home page" do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context "given an inactive collection" do
      let(:active) { false }

      it "redirects to the home page" do
        subject
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
