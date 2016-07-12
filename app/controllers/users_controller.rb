class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to shops_path
    end
  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "User successfully deleted!"
      redirect_to users_path
    end
  end
end
