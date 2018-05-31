class PhotosController < ApplicationController
  before_action :set_tank_location, :only => [ :create ]


  ## TEST Comment
  
  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    @tank_location.photos << @photo
    if @photo.save
      redirect_to @tank_location
    else
      @photo.errors.full_messages
      render "new"
    end
  end

  def destroy
  end

  def upvote
    @photo = Photo.find(params[:id])
    @photo.upvote_by current_user
    redirect_to @photo.tank_location
  end

  def downvote
    @photo = Photo.find(params[:id])
    @photo.downvote_by current_user
    redirect_to @photo.tank_location
  end

  private
    def set_tank_location
      @tank_location = TankLocation.find(params[:tank_location_id])
    end

    def photo_params
      params.require(:photo).permit(:image)
    end
end
