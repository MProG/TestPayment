class ProductsController < ApplicationController
  before_action :auth_user, except: [:index]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.where(state: :active)
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params.merge(user: current_user))

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.update(state: :disabled)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    product_params = params.require(:product).permit(:name, :price, :description)
    product_params[:price] = product_params[:price].to_f * 100
    product_params
  end
end
