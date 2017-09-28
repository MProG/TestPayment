require "rails_helper"

describe ChargesController do
  let(:user) { User.create(email: "test@gmail.com", password: "12345678") }
  let(:product) { double(price: 500) }
  let(:customer) { double(id: 15) }

  describe "#create" do
    it "returns http success" do
      sign_in user

      allow(Product).to receive(:find_by).with(id: "5", state: :active).and_return(product)
      allow(ChargeService).to receive(:make_charge).with(user, product, nil)

      get :create, params: { product_id: 5 }
      expect(response).to have_http_status(:success)
    end
  end
end
