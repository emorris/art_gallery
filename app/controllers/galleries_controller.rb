class GalleriesController < ApplicationController
  def index
    galleries = Gallery.all.includes(:pictures)
    render json: galleries
  end

  def show
   gallery = Gallery.includes(:pictures).find(params[:id])
   render json: gallery, include: :pictures
  end
end
