class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all.includes(:pictures)
    render json: @galleries
  end

  def show
     @gallery = Gallery.includes(:shows).find(params[:id])
     render json: @gallery
  end
end
