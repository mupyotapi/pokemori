class ProductsController < RankingController

    before_action :move_to_index, except: :index

    def index
      @products = Product.includes(:user).page(params[:page]).per(10).order("created_at DESC")
    end

    def new
      @product = Product.new
      @review = Review.new
    end

    def create
    # @product = Product.new(product_params,user_id: current_user.id)

    # respond_to do |format|
    #   if @product.save
    #     format.html { redirect_to @product, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end


      @product = Product.create(roomname: product_params[:roomname], image: product_params[:image], text: product_params[:text], user_id: current_user.id)

      # respond_to do |format|
      #   if @product.save
      #     format.html { redirect_to @product, notice: 'Post was successfully created.' }
      #     format.json { render :show, status: :created, location: @product }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @product.errors, status: :unprocessable_entity }
      #   end
      # end
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

      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.includes(:user)
    @review = Review.new
    end

    private
    # def product_params
    #   params.permit(:roomname, :image, :text)
    # end

    def product_params
      params.require(:product).permit(:roomname, :text, :image)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
