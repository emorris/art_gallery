class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render json: @galleries
  end

  def show
     @gallery = Gallery.find(params[:id])
     render json: @gallery
  end
end
