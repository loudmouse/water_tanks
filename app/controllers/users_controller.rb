class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy]
  
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @user_tanks_mapped = @user.tank_locations
    make_markers(@user_tanks_mapped)
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
end
