class ProductsController < ApplicationController
    def index
      @products = Product.all
    end

    def new
    end

    def create
      Product.create(product_params)
    end

    private
    def product_params
      params.permit(:name, :image, :text)
      # params.permit(:roomname, :image, :username, :usernumber, :text)
    end
end
