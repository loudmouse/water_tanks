class PhotosController < ApplicationController
  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo
    else
      @photo.errors.full_messages
      render "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
  end

  private

    def photo_params
      params.require(:photo).permit(:image)
    end
end
