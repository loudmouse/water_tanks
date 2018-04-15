class TankLocationsController < ApplicationController
  def new
    @tank_location = TankLocation.new
  end

  def create
    @tank_location = TankLocation.new(location_params)
    if @tank_location.save
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render new
    end
  end

  def edit
    if @tank_location.save
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render new
    end
  end

  def destroy
  end

  def show
  end

  def index
  end
end
