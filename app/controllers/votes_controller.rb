class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    unless Vote.find_by(review_id: params[:review_id], user_id: current_user[:id]).nil?
      @search = Vote.find_by(review_id: params[:review_id], user_id: current_user[:id])
      @vote = Vote.find_by(review_id: params[:review_id], user_id: current_user[:id])
      @vote.upvote = params[:vote][:upvote]
      if @search.upvote != @vote.upvote
        @vote.save
      else
        @vote.destroy
        flash[:notice] = "Vote removed!"
      end
    else
      @vote = Vote.new(vote_params)
      @vote.review = @review
      @vote.user = current_user
      if !@vote.save
        flash[:notice] = "Something went wrong."
      end
    end
    redirect_to shop_path(@review.shop)
  end

  private

  def vote_params
    params.require(:vote).permit(:upvote)
  end
end
