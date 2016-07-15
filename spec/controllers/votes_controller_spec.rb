require "rails_helper"

RSpec.describe VotesController, type: :controller do
  let!(:user) { FactoryGirl.create(:user, password: "password") }
  let!(:shop) { FactoryGirl.create(:shop, user_id: user.id) }
  let!(:review) { FactoryGirl.create(:review, user_id: user.id, shop_id: shop.id) }
  let(:vote) { FactoryGirl.create(:vote, user_id: user.id, review_id: review.id, upvote: true) }

  describe "POST create" do
    it "modifies an existing vote" do
      vote
      sign_in(user)
      post :create, id: vote.id, review_id: review.id, vote: { upvote: false }, format: :json
      expect(Vote.count).to eq(1)
      expect(Vote.find(1).upvote).to be false
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end

    it "deletes an existing vote" do
      vote
      sign_in(user)
      post :create, id: vote.id, review_id: review.id, vote: { upvote: true }, format: :json
      expect(Vote.count).to eq(0)
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end

    it "creates a new vote" do
      sign_in(user)
      post :create, id: vote.id, review_id: review.id, vote: { upvote: false }, format: :json
      expect(Vote.count).to eq(1)
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end
  end
end
