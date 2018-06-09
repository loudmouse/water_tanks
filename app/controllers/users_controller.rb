class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @user_tanks_mapped = @user.tank_locations
  end

  def destroy
  end
end
