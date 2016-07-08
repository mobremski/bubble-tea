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

  def destroy
    @review = Review.find(params[:id])
    @shop = Shop.find(params[:shop_id])
    @review.destroy
    flash[:notice] = "Review deleted!"
    redirect_to shop_path(@shop)
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    @review = Review.find(params[:review_id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated!"
      redirect_to shop_path(@shop)
    else
      flash.now[:error] = @review.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :review_id)
  end
end
