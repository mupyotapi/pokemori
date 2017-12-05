class ProductsController < ApplicationController

    before_action :move_to_index, except: :index

    def index
      @products = Product.includes(:user).page(params[:page]).per(10).order("created_at DESC")
    end

    def new
    end

    def create
      Product.create(roomname: product_params[:roomname], image: product_params[:image], text: product_params[:text], user_id: current_user.id)
    end

    def destroy
      product = Product.find(params[:id])
      product.destroy if product.user_id == current_user.id
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      product = Product.find(params[:id])
      if product.user_id == current_user.id
        product.update(product_params)
      end
    end

    def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.includes(:user)
    end

    private
    def product_params
      params.permit(:roomname, :image, :text)
      # params.permit(:roomname, :image, :username, :usernumber, :text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
