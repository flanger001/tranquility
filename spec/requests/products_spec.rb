require "rails_helper"

RSpec.describe ProductsController do
  let(:product) { create(:product) }

  it "gets a product" do
    get product_path(url: product.url)
    expect(response).to have_http_status(:success)
  end

  it "redirects if attempting to get nonexistent product" do
    get product_path(url: "not-real")
    expect(response).to have_http_status(:redirect)
  end
end
