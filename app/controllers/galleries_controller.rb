class GalleriesController < ApplicationController
  def index
    galleries = Gallery.all.visible.includes(:pictures).get_first_image
    render json: galleries, include: :pictures
  end

  def show
   gallery = Gallery.includes(:pictures).find(params[:id])
   render json: gallery, include: :pictures
  end
end
