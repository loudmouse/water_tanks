class TankLocationsController < ApplicationController
  def new
    @tank_location = current_user.tank_locations.build

  end

  def create
    @tank_location = current_user.tank_locations.build(tank_location_params)
    if @tank_location.save
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render "new"
    end
  end

  def edit
    if @tank_location.save
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render "new"
    end
  end

  def destroy
  end

  def show
  end

  def index
  end

  private

    def tank_location_params
      params.require(:tank_location).permit(:address, :latitude, :longitude)
    end
end
