require "rails_helper"

describe "Products", type: :request do
  describe "/products" do
    it "seccsess request to products list" do
      get products_path
      expect(response).to have_http_status(200)
    end
  end
end
