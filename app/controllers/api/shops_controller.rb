class Api::ShopsController < ApiController
  def index
    shops = Shop.all
    render json: { shops: shops }, status: :ok
  end
end
