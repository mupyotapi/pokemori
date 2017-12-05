class ReviewsController < ApplicationController
  def create
    @review = Review.create(review: review_params[:review], product_id: review_params[:product_id], user_id: current_user.id)
    redirect_to "/products/#{@review.product.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def review_params
    params.permit(:review, :product_id)
  end
end
