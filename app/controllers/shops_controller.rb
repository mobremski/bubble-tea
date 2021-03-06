class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @shops = Shop.search(params[:query])
    @shop = Shop.new
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    if @shop.save
      flash[:notice] = "Shop added successfully"
      redirect_to shop_path(@shop)
    else
      flash.now[:error] = @shop.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
    @vote = Vote.new
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    flash[:notice] = "Shop deleted!"
    redirect_to shops_path
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:notice] = "Shop updated!"
      redirect_to shop_path(@shop)
    else
      flash.now[:error] = @shop.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :city, :state, :zip, :description, :pricing, :hours)
  end
end
