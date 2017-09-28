require "rails_helper"

describe ProductsController do
  let(:user) { User.create(email: "test@gmail.com", password: "12345678") }
  let(:valid_attributes) { { name: "test_name", price: 3, user: user } }
  let(:invalid_attributes) { { name: nil, price: 3 } }
  subject(:product) { Product.create! valid_attributes }

  describe "#index" do
    it "returns a success response" do
      get :index

      expect(response).to be_success
    end
  end

  describe "#show" do
    it "returns a success response" do
      sign_in user

      get :show, params: { id: product.to_param }

      expect(response).to be_success
    end
  end

  describe "#new" do
    it "returns a success response" do
      sign_in user

      get :new

      expect(response).to be_success
    end
  end

  describe "#edit" do
    it "returns a success response" do
      sign_in user

      get :edit, params: { id: product.to_param }

      expect(response).to be_success
    end
  end

  describe "#create" do
    before do
      sign_in user
    end

    context "with valid params" do
      it "creates a new Product" do
        expect do
          post :create, params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, params: { product: valid_attributes }

        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: { product: invalid_attributes }

        expect(response).to be_success
      end
    end
  end

  describe "#update" do
    before do
      sign_in user
    end

    context "with valid params" do
      let(:new_attributes) { { name: "Cool new name", price: 5 } }

      it "updates the requested product" do
        put :update, params: { id: product.to_param, product: new_attributes }
        product.reload

        expect(product.name).to eql(new_attributes[:name])
      end

      it "redirects to the product" do
        put :update, params: { id: product.to_param, product: valid_attributes }

        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: product.to_param, product: invalid_attributes }

        expect(response).to be_success
      end
    end
  end

  describe "#destroy" do
    it "change state for product" do
      sign_in user

      delete :destroy, params: { id: product.to_param }
      product.reload

      expect(product.state).to eql("disabled")
    end
  end
end
