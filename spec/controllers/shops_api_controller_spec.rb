require "rails_helper"

RSpec.describe Api::ShopsController, type: :controller do
  describe "GET index" do
    it "gets a list of shops when no query is provided" do
      shops = create_list(:shop, 5)
      get :index, query: "", format: :json
      json = JSON.parse(response.body)
      ids = json["shops"].map { |c| c["id"] }
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
      expect(ids).to match_array(shops.map(&:id))
    end

    it "gets search results when a query is provided" do
      user = FactoryGirl.create(:user, password: "password")
      shop = FactoryGirl.create(:shop, user_id: user.id)
      shop2 = FactoryGirl.create(:shop, user_id: user.id, name: "Tea Break")
      get :index, query: "Tea Break", format: :json
      json = JSON.parse(response.body)
      ids = json["shops"].map { |c| c["name"] }
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
      expect(ids.count).to be 1
      expect(ids[0]).to eq "Tea Break"
    end
  end
end
