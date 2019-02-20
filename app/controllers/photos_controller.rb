class PhotosController < ApplicationController
  def index
    @photos = Photo.order('created_at')
  end

  #New action for creating a new photo
  def new
    @photos = Photo.new
  end

  #Create action ensures that submitted photo gets created if it meets the requirements
  def create
    @photos = Photo.new(photo_params)
    if @photos.save
      flash[:notice] = "Successfully added new photo!"
      redirect_to :controller => 'agentoptions', :action => 'index'
    else
      flash[:alert] = "Error adding new photo!"
      render :new
    end
  end

  private

  #Permitted parameters when creating a photo. This is used for security reasons.
  def photo_params
    params.require(:photo).permit(:tour_id, :image)
  end
end
