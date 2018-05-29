class TankLocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @tank_locations = TankLocation.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    make_markers(@tank_locations)
    @latest_tank = TankLocation.last
  end

  def new
    @tank_locations = TankLocation.all
    @tank_location = current_user.tank_locations.build
    @tank_location.photos.new
    make_markers(@tank_locations)
  end

  def create
    @tank_location = current_user.tank_locations.new(tank_location_params)
    @tank_location.photos.first.user_id = current_user.id if @tank_location.photos.first
    if @tank_location.save
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render "new"
    end
  end

  def edit

  end

  def update
    if @tank_location.update(tank_location_params)
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render "new"
    end
  end

  def show
    @tank_location = TankLocation.find(params[:id])
    make_markers(@tank_location)
  end

  def destroy
  end


  private

    def make_markers(locations)
        @hash = Gmaps4rails.build_markers(locations) do |tank_location, marker|
          marker.lat tank_location.latitude
          marker.lng tank_location.longitude
          marker.infowindow ActionController::Base.helpers.image_tag tank_location.photos.first.image.url(:medium)
          marker.picture({
                    :url    => "https://image.ibb.co/iQugxS/water_tank_icon.png",
                    :width  => "32",
                    :height => "32"
                   })
        end
    end

    def set_location
      @tank_location = TankLocation.find(params[:id])
    end

    def tank_location_params
      params.require(:tank_location).permit(:address, :latitude, :longitude, :neighborhood, photos_attributes: [:image] )
    end
end
