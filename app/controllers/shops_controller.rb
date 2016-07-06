class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = "Shop added successfully"
      redirect_to shop_path(@shop)
    else
      flash[:error] = @shop.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :city, :state, :zip, :description, :pricing, :hours)
  end
end
