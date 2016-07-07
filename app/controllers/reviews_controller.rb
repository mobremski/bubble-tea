class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.new(review_params)
    @review.shop = @shop
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to shop_path(@shop)
    else
      flash.now[:error] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :shop_id)
  end
end
