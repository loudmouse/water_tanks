class TankLocations::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = TankLocation.find(params[:tank_location_id])
  end
end