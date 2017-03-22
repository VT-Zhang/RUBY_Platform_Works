class ProductsController < ApplicationController
  def index
      @users = User.all
      @products = Product.all
  end

  def new
  end

  def create
      @product = Product.create( name: params[:name], description: params[:description])
      redirect_to '/products/index'
  end
end
