class ShowsController < ApplicationController
  def index
    
    render json: Gallery.find(params[:gallery_id]).shows.time_separation
  end

  def show
    @show = Gallery.find(params[:gallery_id]).shows.find(params[:id])
    render json: @show, include: :pictures
  end
end
