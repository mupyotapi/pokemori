class ProductsController < ApplicationController

    before_action :move_to_index, except: :index

    def index
      @products = Product.order("created_at DESC").page(params[:page]).per(20)
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

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
