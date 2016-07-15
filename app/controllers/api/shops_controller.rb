class Api::ShopsController < ApiController
  def index
    shops = Shop.search(params[:query])
    @shop = Shop.new
    render json: { shops: shops }, status: :ok
  end
end
