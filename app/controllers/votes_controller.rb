class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    if Vote.find(review_id: params[:review_id], user_id: current_user[:id]) != nil
      @vote = Vote.find(review_id: params[:review_id], user_id: current_user[:id])
      if @vote.upvote != params[:vote][:upvote]
        if @review.update_attributes(vote_params)
          if @vote.upvote == true
            @review.votecount += 1
            @review.save
          elsif @vote.upvote == false
            @review.votecount -= 1
            @review.save
          end
        end
        redirect_to shop_path(@review.shop)
      else
        flash[:error] = "You have already voted"
        redirect_to shop_path(@review.shop)
      end
    else
      @vote = Vote.new(vote_params)
      @vote.review = @review
      @vote.user = current_user
      binding.pry
      if @vote.save
        if @vote.upvote == true
          @review.votecount += 1
          @review.save
        elsif @vote.upvote == false
          @review.votecount -= 1
          @review.save
        end
        redirect_to shop_path(@review.shop)
      else
        flash[:error] = "Something went wrong."
        redirect_to shop_path(@review.shop)
      end
    end
  end

  def update
  end

  def user_voted?(review)
    if Vote.find(review: review, user: current_user) != nil
      return true
    else
      return false
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :review_id, :upvote)
  end
end